import 'dart:async';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/local/stem_names.dart';

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

  void toggleMetronome();
  void setMetronomeSpeed(int speed);
  void setMetronomeVolume(double volume);
}

abstract class PlayerSongEndedEvent {}
