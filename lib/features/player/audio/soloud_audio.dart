import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/local/stem_names.dart';
import 'package:stemix_frontend/features/player/audio/audio_interface.dart';
import 'package:stemix_frontend/main.dart';

@LazySingleton()
class SoloudImplementation implements PlayerInterface {
  final Map<StemName, AudioSource> sources = {};
  final Map<StemName, SoundHandle> handles = {};
  int streamNum = 1;

  SoloudImplementation() {
    logger.f("SoloudImplementation created");
    logger.f("Stream creato");
  }

  @override
  Duration get currentPosition =>
      SoLoud.instance.getPosition(handles.values.first);

  @override
  Stream<int> get positionStream {
    streamNum++;
    return Stream<int>.periodic(const Duration(milliseconds: 500), (count) {
          logger.i("Position stream$streamNum tick: $count");
          return count;
        })
        .doOnListen(() {
          logger.f("Position stream$streamNum listened");
        })
        .doOnCancel(() {
          logger.f("Position stream$streamNum cancelled");
        });
  }

  @override
  Future<void> ensureInitialized() async {
    if (SoLoud.instance.isInitialized) {
      return;
    }

    logger.f("SoloudImplementation initialized");
    return await SoLoud.instance.init();
  }

  @override
  Future<void> ensureCleanedUp() async {
    if (sources.isEmpty && handles.isEmpty) {
      return;
    }

    logger.f("SoloudImplementation cleaned up");
    final promise = SoLoud.instance.disposeAllSources();
    sources.clear();
    handles.clear();
    return await promise;
  }

  @override
  Future<void> loadTracks(Song song) async {
    await _loadTrack(StemName.bass, song.bassPath, song.bassVol);
    await _loadTrack(StemName.drums, song.drumsPath, song.drumsVol);
    await _loadTrack(StemName.guitar, song.guitarPath, song.guitarVol);
    await _loadTrack(StemName.other, song.otherPath, song.otherVol);
    await _loadTrack(StemName.piano, song.pianoPath, song.pianoVol);
    await _loadTrack(StemName.vocals, song.vocalsPath, song.vocalsVol);
  }

  @override
  void pause() async {
    for (final key in handles.keys) {
      SoLoud.instance.setPause(handles[key]!, true);
    }
  }

  @override
  void play() async {
    for (final key in handles.keys) {
      SoLoud.instance.setPause(handles[key]!, false);
    }
  }

  @override
  void seek(Duration position) {
    for (final key in handles.keys) {
      SoLoud.instance.seek(handles[key]!, position);
    }
  }

  @override
  void setVolume(StemName StemName, double volume) {
    final handle = handles[StemName];
    if (handle != null) {
      SoLoud.instance.setVolume(handle, volume);
    }
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  // TODO: implement playingStream
  Stream<bool> get playingStream => throw UnimplementedError();

  @override
  void setMetronomeMultiplier(double multiplier) {
    // TODO: implement setMetronomeMultiplier
  }

  @override
  void setMetronomeVolume(double vol) {
    // TODO: implement setMetronomeVolume
  }

  @override
  void toggleMetronome(bool enabled) {
    // TODO: implement toggleMetronome
  }

  Future<void> _loadTrack(
    StemName StemName,
    String? path,
    double volume,
  ) async {
    if (path == null) {
      logger.i("$StemName is null");
    } else {
      final source = await SoLoud.instance.loadFile(path, mode: LoadMode.disk);
      sources[StemName] = source;
      handles[StemName] = await SoLoud.instance.play(source, paused: true);
      SoLoud.instance.setVolume(handles[StemName]!, volume);
    }
  }
}

class SoloudImplementationException implements Exception {}

class NeedToStopException implements Exception {}
