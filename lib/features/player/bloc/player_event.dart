import 'package:equatable/equatable.dart';

class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object?> get props => [];
}

class LoadPlayerEvent extends PlayerEvent {}

class PlayEvent extends PlayerEvent {}

class PauseEvent extends PlayerEvent {}

class SkipDurationEvent extends PlayerEvent {
  final bool absolute;
  final int amount;
  const SkipDurationEvent({this.absolute = false, this.amount = 10});
}
