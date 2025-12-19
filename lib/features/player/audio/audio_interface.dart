import 'dart:async';
import 'package:stemix_frontend/data/local/drift/database.dart';

abstract class PlayerInterface {
  Stream<Duration> get positionStream;
  Stream<bool> get playingStream;
  Duration get duration;

  // Metodi principali
  Future<void> ensureInitialized();
  Future<void> ensureCleanedUp();
  Future<void> loadTracks(Song song);
  void play();
  void pause();
  Future<void> seek(Duration position);
  Future<void> dispose();

  // Controllo volumi e metronomo
  void setVolume(String stem, double volume);
  void toggleMetronome(bool enabled);
  void setMetronomeMultiplier(double multiplier);
  void setMetronomeVolume(double vol);
}
