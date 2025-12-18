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

class SelectAllEvent extends LibraryEvent {
  // Could be used to select or deselect all
  final bool isSelect;
  const SelectAllEvent(this.isSelect);

  @override
  List<Object> get props => [isSelect];
}

class DeleteSelectedSongsEvent extends LibraryEvent {}
