import 'package:equatable/equatable.dart';
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/data/local/drift/stem_names.dart';

class PlayerState extends Equatable {
  const PlayerState();
  @override
  List<Object?> get props => [];
}

class PlayerLoading extends PlayerState {}

class PlayerLoaded extends PlayerState {
  final MetronomeSpeed metronomeSpeed;
  final bool isMetronomeEnabled;
  final bool isSaved;
  final bool isPlaying;
  final Map<StemName, double> stemVolumes;

  const PlayerLoaded({
    this.metronomeSpeed = MetronomeSpeed.normal,
    this.isMetronomeEnabled = false,
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
    MetronomeSpeed? metronomeSpeed,
    bool? isMetronomeEnabled,
    bool? isPlaying,
    Map<StemName, double>? stemVolumes,
    bool? isSaved,
  }) {
    return PlayerLoaded(
      metronomeSpeed: metronomeSpeed ?? this.metronomeSpeed,
      isMetronomeEnabled: isMetronomeEnabled ?? this.isMetronomeEnabled,
      isPlaying: isPlaying ?? this.isPlaying,
      stemVolumes: stemVolumes ?? this.stemVolumes,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  List<Object?> get props => [
    metronomeSpeed,
    isMetronomeEnabled,
    isPlaying,
    stemVolumes,
    isSaved,
  ];
}

class PlayerError extends PlayerState {
  final String message;

  const PlayerError(this.message);

  @override
  List<Object?> get props => [message];
}
