import 'package:equatable/equatable.dart';

class PlayerState extends Equatable {
  const PlayerState();
  @override
  List<Object?> get props => [];
}

class PlayerLoading extends PlayerState {}

class PlayerLoaded extends PlayerState {}
