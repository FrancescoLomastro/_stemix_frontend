part of 'library_bloc.dart';

class LibraryEvent extends Equatable {
  const LibraryEvent();
  @override
  List<Object?> get props => [];
}

class LoadSongsEvent extends LibraryEvent {}

class ToggleSelectionModeEvent extends LibraryEvent {}

class ToggleSongSelectionEvent extends LibraryEvent {
  final int songId;
  const ToggleSongSelectionEvent(this.songId);

  @override
  List<Object> get props => [songId];
}

class DeleteSelectedSongsEvent extends LibraryEvent {}
