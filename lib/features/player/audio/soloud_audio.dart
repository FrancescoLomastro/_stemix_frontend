import 'dart:async';

import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/data/local/drift/stem_names.dart';
import 'package:stemix_frontend/features/player/audio/audio_interface.dart';
import 'package:stemix_frontend/logger.dart';

class SoundHandlePair {
  final SoundHandle handle;
  final double volume;
  const SoundHandlePair(this.handle, this.volume);
}

typedef SoLoudSubscription =
    StreamSubscription<
      ({SoundEventType event, SoundHandle handle, AudioSource sound})
    >;

@LazySingleton()
class SoloudImplementation implements PlayerInterface {
  bool _isCleanedUp = true;

  /// To handle stems
  Map<StemName, AudioSource>? _sources;
  Map<StemName, SoundHandlePair>? _handles;

  /// To handle "the end" of song callback
  Null Function()? _endCallBack;
  SoLoudSubscription? _endSubscription;

  /// To handle metronome
  AudioSource? _metronomeSource;
  Timer? _metronomeTimer;
  int? _metronomeNextTick;
  MetronomeSpeed? _metronomeSpeed;
  List<double>? _metronomeBeats;
  double? _metronomeVolume;

  /// Current position of the song
  @override
  Duration get currentPosition {
    if (_handles == null || _handles!.isEmpty) {
      throw Exception("Can't get position because handles are null or empty");
    }
    return SoLoud.instance.getPosition(_handles!.values.first.handle);
  }

  /// Starts a periodic stream that emits the current position of the song
  @override
  Stream<int> get positionStream {
    return Stream<int>.periodic(const Duration(milliseconds: 500), (_) {
      return currentPosition.inSeconds;
    });
  }

  /// Initialize SoLoud audio engine
  @override
  Future<void> ensureInitialized() async {
    if (SoLoud.instance.isInitialized) {
      return;
    }
    return await SoLoud.instance.init();
  }

  /// Clean up SoLoud audio engine and free resources
  @override
  Future<void> ensureCleanedUp() async {
    if (_isCleanedUp) {
      return;
    }

    // NOTE: always clear "the end" callback before clearing handles and sources
    _cleanEndSong();
    await _cleanHandles();
    await _cleanSources();
    await _cleanMetronome();
    _isCleanedUp = true;
  }

  /// Load tracks, metronome, set volumes, and setup "the end" handling
  @override
  Future<void> loadTracks(Song song) async {
    _isCleanedUp = false;
    _sources = {};
    _handles = {};
    await _loadTrack(StemName.vocals, song.vocalsPath, song.vocalsVol);
    await _loadTrack(StemName.bass, song.bassPath, song.bassVol);
    await _loadTrack(StemName.drums, song.drumsPath, song.drumsVol);
    await _loadTrack(StemName.guitar, song.guitarPath, song.guitarVol);
    await _loadTrack(StemName.other, song.otherPath, song.otherVol);
    await _loadTrack(StemName.piano, song.pianoPath, song.pianoVol);

    await _loadMetronomeData(
      song.musicBeatsPositions,
      song.metronomeSpeed,
      song.metronomeVolume,
    );
    _resetMetronome();

    // Listen for the end of the first track to signal the end of the song
    final endStream = _sources!.values.first.soundEvents;
    _endSubscription = endStream.listen((eventData) async {
      if (eventData.event == SoundEventType.handleIsNoMoreValid) {
        await _resetsHandles();
        _resetMetronome();
        if (_endCallBack != null) {
          _endCallBack!();
        }
      }
    });
  }

  /// Pause playback of all stems and metronome
  @override
  void pause() async {
    for (final key in _handles!.keys) {
      SoLoud.instance.setPause(_handles![key]!.handle, true);
    }

    _pauseMetronome();
  }

  /// Play all stems and start metronome
  @override
  void play() async {
    if (_metronomeTimer != null) {
      throw Exception("Can't play metronome, it's already playing");
    }

    for (final key in _handles!.keys) {
      SoLoud.instance.setPause(_handles![key]!.handle, false);
    }

    _metronomeTimer = _playMetronomeTimer();
  }

  /// Seek all stems and metronome to the given position
  @override
  void seek(Duration position) {
    if (_metronomeBeats == null) {
      throw Exception("Can't seek because metronome beats are null");
    }

    for (final key in _handles!.keys) {
      SoLoud.instance.seek(_handles![key]!.handle, position);
    }
    _seekMetronome(position);
  }

  /// Sets metronome speed
  @override
  void setMetronomeSpeed(MetronomeSpeed speed) {
    _metronomeSpeed = speed;
    // we need to adjust nextTickPosition to be aligned with the new speed
    while (_metronomeNextTick! % _metronomeSpeed!.multiplier != 0) {
      _metronomeNextTick = _metronomeNextTick! + 1;
    }
  }

  /// Sets volume for a specific stem
  @override
  void setVolume(StemName? stemName, double volume) {
    if (stemName == null) {
      // metronome does not save handles
      _metronomeVolume = volume;
    } else {
      final handlePair = _handles![stemName];
      if (handlePair != null) {
        SoLoud.instance.setVolume(handlePair.handle, volume);
        _handles![stemName] = SoundHandlePair(handlePair.handle, volume);
      }
    }
  }

  /// Sets the callback to be called when the song ends
  @override
  void onEnd(Null Function() callback) {
    _endCallBack = callback;
  }

  ///  Seek metronome to the given position
  void _seekMetronome(Duration position) {
    // Use binary search to find the next tick position
    int left = 0;
    int right = _metronomeBeats!.length;
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      if (_metronomeBeats![mid] < position.inMilliseconds) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    _metronomeNextTick = left;
  }

  /// Play metronome timer
  Timer _playMetronomeTimer() {
    return Timer.periodic(
      Duration(milliseconds: 20),
      (_) => _onMetronomeTick(),
    );
  }

  /// Pause (kills) metronome timer
  void _pauseMetronome() {
    _metronomeTimer?.cancel();
    _metronomeTimer = null;
  }

  /// Resets handles and their volumes as they were before the song ended
  Future<void> _resetsHandles() async {
    final Map<StemName, SoundHandlePair> newHandles = {};
    for (final entry in _sources!.entries) {
      final stemName = entry.key;
      final source = entry.value;
      final volume = _handles![stemName]!.volume;
      final handle = await SoLoud.instance.play(source, paused: true);
      SoLoud.instance.setVolume(handle, volume);
      newHandles[stemName] = SoundHandlePair(handle, volume);
    }
    _handles!
      ..clear()
      ..addAll(newHandles);
  }

  /// Reset metronome to the beginning
  void _resetMetronome() {
    if (_metronomeSpeed == null ||
        _metronomeVolume == null ||
        _metronomeBeats == null ||
        _metronomeSource == null) {
      throw Exception('Metronome data not loaded');
    }

    _pauseMetronome();
    _metronomeNextTick = 0;
  }

  /// Clear all sound handles
  Future<void> _cleanHandles() async {
    for (final handlePair in _handles!.values) {
      await SoLoud.instance.stop(handlePair.handle);
    }
    _handles!.clear();
  }

  /// Clear all audio sources
  Future<void> _cleanSources() async {
    await SoLoud.instance.disposeAllSources();
    _sources?.clear();
  }

  /// Clear end of song callback and subscription
  void _cleanEndSong() {
    _endSubscription?.cancel();
    _endCallBack = null;
  }

  /// Clear metronome resources
  Future<void> _cleanMetronome() async {
    if (_metronomeSource != null) {
      await SoLoud.instance.disposeSource(_metronomeSource!);
      _metronomeSource = null;
    }
    if (_metronomeTimer != null) {
      _pauseMetronome();
    }
    _metronomeNextTick = null;
    _metronomeSpeed = null;
    _metronomeBeats = null;
    _metronomeVolume = null;
  }

  /// Load a track for a specific stem
  Future<void> _loadTrack(
    StemName stemName,
    String? path,
    double volume,
  ) async {
    if (path == null) {
      logger.i("$stemName is null");
    } else {
      final source = await SoLoud.instance.loadFile(path, mode: LoadMode.disk);
      _sources![stemName] = source;
      final handle = await SoLoud.instance.play(source, paused: true);
      SoLoud.instance.setVolume(handle, volume);
      _handles![stemName] = SoundHandlePair(handle, volume);
    }
  }

  /// Load metronome data
  Future<void> _loadMetronomeData(
    List<double> musicBeatsPositionsMs,
    MetronomeSpeed metronomeSpeed,
    double metronomeVolume,
  ) async {
    _metronomeSpeed = metronomeSpeed;
    _metronomeBeats = musicBeatsPositionsMs;
    _metronomeVolume = metronomeVolume;
    _metronomeSource = await SoLoud.instance.loadAsset(
      'assets/sounds/metronome_click.wav',
      mode: LoadMode.memory,
    );
  }

  /// Handles metronome tick events
  void _onMetronomeTick() {
    final currentTimeMs = currentPosition.inMilliseconds.toDouble();

    if (_metronomeNextTick! >= _metronomeBeats!.length) {
      _pauseMetronome();
    } else if (_metronomeBeats![_metronomeNextTick!] <= currentTimeMs) {
      if (_metronomeVolume! > 0.0) {
        SoLoud.instance.play(_metronomeSource!, volume: _metronomeVolume!);
      }
      _metronomeNextTick = _metronomeNextTick! + _metronomeSpeed!.multiplier;
    }
  }
}
