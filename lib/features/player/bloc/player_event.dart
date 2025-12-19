import 'package:equatable/equatable.dart';
import 'package:stemix_frontend/data/local/stem_names.dart';

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

class SetVolumeEvent extends PlayerEvent {
  final StemName stemName;
  final double volume;
  const SetVolumeEvent(this.stemName, this.volume);

  @override
  List<Object?> get props => [stemName, volume];
}

class SaveEvent extends PlayerEvent {
  final Map<StemName, double> stemVolumes;
  const SaveEvent({
    this.stemVolumes = const {
      StemName.vocals: 0.1,
      StemName.bass: 0.1,
      StemName.drums: 0.1,
      StemName.other: 0.1,
      StemName.piano: 0.1,
      StemName.guitar: 0.1,
    },
  });

  @override
  List<Object?> get props => [stemVolumes];
}
