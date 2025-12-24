import 'dart:async';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/data/local/drift/stem_names.dart';

abstract class PlayerInterface {
  Stream<int> get positionStream;
  Duration get currentPosition;
  Future<void> ensureInitialized();
  Future<void> ensureCleanedUp();
  Future<void> loadTracks(Song song);
  void seek(Duration position);
  void play();
  void pause();
  void onEnd(Null Function() callback);
  void setVolume(StemName stemName, double volume);
  void setMetronomeSpeed(MetronomeSpeed speed);
}

abstract class PlayerSongEndedEvent {}
