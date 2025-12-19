import 'package:equatable/equatable.dart';

class PlayerState extends Equatable {
  const PlayerState();
  @override
  List<Object?> get props => [];
}

class PlayerLoading extends PlayerState {}

class PlayerLoaded extends PlayerState {
  final bool isPlaying;

  const PlayerLoaded({this.isPlaying = false});

  PlayerLoaded copyWith({bool? isPlaying}) {
    return PlayerLoaded(isPlaying: isPlaying ?? this.isPlaying);
  }

  @override
  List<Object?> get props => [isPlaying];
}
