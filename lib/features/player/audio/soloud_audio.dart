import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/features/player/audio/audio_interface.dart';

class SoloudImplementation implements PlayerInterface {
  SoLoud? instance;

  //create an array of audio sources
  final List<AudioSource> sources = [];
  final List<SoundHandle> handles = [];
  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  // TODO: implement duration
  Duration get duration => throw UnimplementedError();

  @override
  Future<void> initialize() async {
    instance = SoLoud.instance;
    await instance!.init();
  }

  @override
  Future<void> loadTracks(Song song) async {
    sources.add(
      await SoLoud.instance.loadFile(song.pathBass!, mode: LoadMode.disk),
    );
    sources.add(
      await SoLoud.instance.loadFile(song.pathDrums!, mode: LoadMode.disk),
    );
    sources.add(
      await SoLoud.instance.loadFile(song.pathGuitar!, mode: LoadMode.disk),
    );
    sources.add(
      await SoLoud.instance.loadFile(song.pathOther!, mode: LoadMode.disk),
    );
    sources.add(
      await SoLoud.instance.loadFile(song.pathPiano!, mode: LoadMode.disk),
    );
    sources.add(
      await SoLoud.instance.loadFile(song.pathVocals!, mode: LoadMode.disk),
    );
  }

  @override
  void pause() async {
    for (var handle in handles) {
      await instance!.stop(handle);
    }
  }

  @override
  void play() async {
    for (var source in sources) {
      handles.add(await instance!.play(source));
    }
  }

  @override
  // TODO: implement playingStream
  Stream<bool> get playingStream => throw UnimplementedError();

  @override
  // TODO: implement positionStream
  Stream<Duration> get positionStream => throw UnimplementedError();

  @override
  Future<void> seek(Duration position) {
    // TODO: implement seek
    throw UnimplementedError();
  }

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
}
