import 'dart:async';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/local/stem_names.dart';

abstract class PlayerInterface {
  Stream<int> get positionStream;
  Stream<bool> get playingStream;
  Duration get currentPosition;

  // Metodi principali
  Future<void> ensureInitialized();
  Future<void> ensureCleanedUp();
  Future<void> loadTracks(Song song);
  void seek(Duration position);
  Future<void> dispose();
  void play();
  void pause();

  // Controllo volumi e metronomo
  void setVolume(StemName stemName, double volume);
  void toggleMetronome(bool enabled);
  void setMetronomeMultiplier(double multiplier);
  void setMetronomeVolume(double vol);
}
