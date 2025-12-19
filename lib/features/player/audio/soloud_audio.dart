import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/features/player/audio/audio_interface.dart';
import 'package:stemix_frontend/main.dart';

@LazySingleton()
class SoloudImplementation implements PlayerInterface {
  final List<AudioSource> sources = [];
  final List<SoundHandle> handles = [];

  SoloudImplementation() {
    logger.f("SoloudImplementation created");
  }

  @override
  Duration get currentPosition => SoLoud.instance.getPosition(handles[0]);

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
    await _loadTrack("pathBass", song.pathBass);
    await _loadTrack("pathDrums", song.pathDrums);
    await _loadTrack("pathGuitar", song.pathGuitar);
    await _loadTrack("pathOther", song.pathOther);
    await _loadTrack("pathPiano", song.pathPiano);
    await _loadTrack("pathVocals", song.pathVocals);
  }

  @override
  void pause() async {
    for (var handle in handles) {
      SoLoud.instance.setPause(handle, true);
    }
  }

  @override
  void play() async {
    for (var handle in handles) {
      SoLoud.instance.setPause(handle, false);
    }
  }

  @override
  void seek(Duration position) {
    for (var handle in handles) {
      SoLoud.instance.seek(handle, position);
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
  // TODO: implement positionStream
  Stream<Duration> get positionStream => throw UnimplementedError();

  @override
  void setMetronomeMultiplier(double multiplier) {
    // TODO: implement setMetronomeMultiplier
  }

  @override
  void setMetronomeVolume(double vol) {
    // TODO: implement setMetronomeVolume
  }

  @override
  void setVolume(String stem, double volume) {
    // TODO: implement setVolume
  }

  @override
  void toggleMetronome(bool enabled) {
    // TODO: implement toggleMetronome
  }

  Future<void> _loadTrack(String stemName, String? path) async {
    if (path == null) {
      logger.i("$stemName is null");
    } else {
      final source = await SoLoud.instance.loadFile(path, mode: LoadMode.disk);
      sources.add(source);
      handles.add(await SoLoud.instance.play(source, paused: true));
    }
  }
}

class SoloudImplementationException implements Exception {}

class NeedToStopException implements Exception {}
