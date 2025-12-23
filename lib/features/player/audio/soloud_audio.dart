import 'dart:async';

import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/data/local/drift/stem_names.dart';
import 'package:stemix_frontend/features/player/audio/audio_interface.dart';
import 'package:stemix_frontend/main.dart';

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
  final Map<StemName, AudioSource> sources = {};
  final Map<StemName, SoundHandlePair> handles = {};

  //to handle end of song callback
  Null Function()? endCallBack;
  SoLoudSubscription? endSubscription;

  //to handle metronome
  bool isMetronomeEnabled = false;
  int nextTickPosition = 0;
  MetronomeSpeed metronomeSpeed = MetronomeSpeed.normal;
  List<double> musicBeatsPositionsMs = [];
  Timer? metronomeTimer;
  AudioSource? metronomeSource;
  double metronomeVolume = 0.0;

  @override
  Duration get currentPosition =>
      SoLoud.instance.getPosition(handles.values.first.handle);

  // A periodic stream that emits the current position of the song
  @override
  Stream<int> get positionStream {
    return Stream<int>.periodic(const Duration(milliseconds: 500), (_) {
      return currentPosition.inSeconds;
    });
  }

  @override
  Future<void> ensureInitialized() async {
    if (SoLoud.instance.isInitialized) {
      return;
    }
    return await SoLoud.instance.init();
  }

  @override
  Future<void> ensureCleanedUp() async {
    if (sources.isEmpty && handles.isEmpty) {
      return;
    }
    // Cancel end subscription, need to do this before clearing handles
    endSubscription?.cancel();
    await _clearHandles();
    await _clearSources();

    metronomeTimer?.cancel();
    metronomeTimer = null;
  }

  @override
  Future<void> loadTracks(Song song) async {
    await _loadTrack(StemName.vocals, song.vocalsPath, song.vocalsVol);
    await _loadTrack(StemName.bass, song.bassPath, song.bassVol);
    await _loadTrack(StemName.drums, song.drumsPath, song.drumsVol);
    await _loadTrack(StemName.guitar, song.guitarPath, song.guitarVol);
    await _loadTrack(StemName.other, song.otherPath, song.otherVol);
    await _loadTrack(StemName.piano, song.pianoPath, song.pianoVol);

    await _loadMetronomeData(
      song.musicBeatsPositions,
      song.isMetronomeEnabled,
      song.metronomeSpeed,
      song.metronomeVolume,
    );

    // Listen for the end of the first track to signal the end of the song
    final endStream = sources.values.first.soundEvents;
    endSubscription = endStream.listen((eventData) async {
      if (eventData.event == SoundEventType.handleIsNoMoreValid) {
        // Handles are now invalide, we need to restore them for future playback
        await _restoreHandles();
        if (endCallBack != null) {
          endCallBack!();
        }
      }
    });
  }

  @override
  void pause() async {
    for (final key in handles.keys) {
      SoLoud.instance.setPause(handles[key]!.handle, true);
    }

    metronomeTimer?.cancel();
    metronomeTimer = null;
  }

  @override
  void play() async {
    for (final key in handles.keys) {
      SoLoud.instance.setPause(handles[key]!.handle, false);
    }

    metronomeTimer ??= Timer.periodic(
      Duration(milliseconds: 20),
      (_) => _onMetronomeTick(),
    );
  }

  @override
  void seek(Duration position) {
    for (final key in handles.keys) {
      SoLoud.instance.seek(handles[key]!.handle, position);
    }

    // Use binary search to find the next tick position
    int left = 0;
    int right = musicBeatsPositionsMs.length;
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      if (musicBeatsPositionsMs[mid] < position.inMilliseconds) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    nextTickPosition = left;
  }

  @override
  void setVolume(StemName stemName, double volume) {
    final handlePair = handles[stemName];
    if (handlePair != null) {
      SoLoud.instance.setVolume(handlePair.handle, volume);
    }
  }

  @override
  void onEnd(Null Function() callback) {
    endCallBack = callback;
  }

  Future<void> _loadTrack(
    StemName stemName,
    String? path,
    double volume,
  ) async {
    if (path == null) {
      logger.i("$stemName is null");
    } else {
      final source = await SoLoud.instance.loadFile(path, mode: LoadMode.disk);
      sources[stemName] = source;
      final handle = await SoLoud.instance.play(source, paused: true);
      SoLoud.instance.setVolume(handle, volume);
      handles[stemName] = SoundHandlePair(handle, volume);
    }
  }

  Future<void> _clearHandles() async {
    for (final handlePair in handles.values) {
      await SoLoud.instance.stop(handlePair.handle);
    }
    handles.clear();
  }

  Future<void> _clearSources() async {
    await SoLoud.instance.disposeAllSources();
    sources.clear();
  }

  // Restore handles and their volumes as they were before
  Future<void> _restoreHandles() async {
    final Map<StemName, SoundHandlePair> newHandles = {};
    for (final entry in sources.entries) {
      final stemName = entry.key;
      final source = entry.value;
      final volume = handles[stemName]!.volume;
      final handle = await SoLoud.instance.play(source, paused: true);
      SoLoud.instance.setVolume(handle, volume);
      newHandles[stemName] = SoundHandlePair(handle, volume);
    }
    handles
      ..clear()
      ..addAll(newHandles);
  }

  Future<void> _loadMetronomeData(
    List<double> musicBeatsPositionsMs,
    bool isMetronomeEnabled,
    MetronomeSpeed metronomeSpeed,
    double metronomeVolume,
  ) async {
    nextTickPosition = 0;
    this.metronomeSpeed = metronomeSpeed;
    this.isMetronomeEnabled = isMetronomeEnabled;
    this.musicBeatsPositionsMs = musicBeatsPositionsMs;
    this.metronomeVolume = metronomeVolume;
    metronomeSource = await SoLoud.instance.loadAsset(
      'assets/sounds/metronome_click.wav',
      mode: LoadMode.memory,
    );
    metronomeTimer = null;
  }

  void _onMetronomeTick() {
    final currentTimeMs = currentPosition.inMilliseconds.toDouble();

    if (nextTickPosition >= musicBeatsPositionsMs.length) {
      metronomeTimer?.cancel();
      metronomeTimer = null;
      SoLoud.instance.disposeSource(metronomeSource!);
    } else if (musicBeatsPositionsMs[nextTickPosition] <= currentTimeMs) {
      if (isMetronomeEnabled) {
        SoLoud.instance.play(metronomeSource!, volume: metronomeVolume);
      }
      nextTickPosition = nextTickPosition + metronomeSpeed.multiplier;
    }
  }

  @override
  void setMetronomeSpeed(MetronomeSpeed speed) {
    metronomeSpeed = speed;
    // we need to adjust nextTickPosition to be aligned with the new speed
    while (nextTickPosition % metronomeSpeed.multiplier != 0) {
      nextTickPosition++;
    }
  }

  @override
  void setMetronomeVolume(double volume) {
    // TODO: implement setMetronomeVolume
  }

  @override
  void setMetronomeEnabled(bool enabled) {
    isMetronomeEnabled = enabled;
  }
}
