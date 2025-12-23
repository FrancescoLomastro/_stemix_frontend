import 'package:equatable/equatable.dart';
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/data/local/drift/stem_names.dart';

class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object?> get props => [];
}

class LoadPlayerEvent extends PlayerEvent {}

class PlayEvent extends PlayerEvent {}

class PauseEvent extends PlayerEvent {}

class SongEndedEvent extends PlayerEvent {}

class ToggleMetronomeEvent extends PlayerEvent {}

class SetMetronomeSpeedEvent extends PlayerEvent {
  final MetronomeSpeed speed;
  const SetMetronomeSpeedEvent(this.speed);

  @override
  List<Object?> get props => [speed];
}

class SkipDurationEvent extends PlayerEvent {
  final bool absolute;
  final int amount;
  const SkipDurationEvent({this.absolute = false, this.amount = 10});
}

class SetVolumeEvent extends PlayerEvent {
  final StemName stemName;
  final double volume;
  const SetVolumeEvent(this.stemName, this.volume);

  @override
  List<Object?> get props => [stemName, volume];
}

class SaveEvent extends PlayerEvent {}
