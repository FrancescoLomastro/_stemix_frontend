import 'dart:async';
import 'package:stemix_frontend/data/local/drift/database.dart';

abstract class PlayerInterface {
  Stream<Duration> get positionStream;
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
  void setVolume(String stem, double volume);
  void toggleMetronome(bool enabled);
  void setMetronomeMultiplier(double multiplier);
  void setMetronomeVolume(double vol);
}
