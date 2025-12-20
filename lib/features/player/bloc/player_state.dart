import 'package:equatable/equatable.dart';
import 'package:stemix_frontend/data/local/stem_names.dart';

class PlayerState extends Equatable {
  const PlayerState();
  @override
  List<Object?> get props => [];
}

class PlayerLoading extends PlayerState {}

class PlayerLoaded extends PlayerState {
  final bool isSaved;
  final bool isPlaying;
  final Map<StemName, double> stemVolumes;

  const PlayerLoaded({
    this.isSaved = true,
    this.isPlaying = false,
    this.stemVolumes = const {
      StemName.vocals: 0.0,
      StemName.bass: 0.0,
      StemName.drums: 0.0,
      StemName.other: 0.0,
      StemName.piano: 0.0,
      StemName.guitar: 0.0,
    },
  });

  PlayerLoaded copyWith({
    bool? isPlaying,
    Map<StemName, double>? stemVolumes,
    bool? isSaved,
  }) {
    return PlayerLoaded(
      isPlaying: isPlaying ?? this.isPlaying,
      stemVolumes: stemVolumes ?? this.stemVolumes,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  List<Object?> get props => [isPlaying, stemVolumes, isSaved];
}

class PlayerError extends PlayerState {
  final String message;

  const PlayerError(this.message);

  @override
  List<Object?> get props => [message];
}
