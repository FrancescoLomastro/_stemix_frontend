part of 'library_bloc.dart';

class LibraryState extends Equatable {
  const LibraryState();
  @override
  List<Object?> get props => [];
}

class LibraryLoading extends LibraryState {}

class LibraryLoaded extends LibraryState {
  final List<Song> songs;
  final bool isSelectionMode;
  final Set<int> selectedSongIds;

  const LibraryLoaded({
    required this.songs,
    this.isSelectionMode = false,
    this.selectedSongIds = const {},
  });

  LibraryLoaded copyWith({
    List<Song>? songs,
    bool? isSelectionMode,
    Set<int>? selectedSongIds,
  }) {
    return LibraryLoaded(
      songs: songs ?? this.songs,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      selectedSongIds: selectedSongIds ?? this.selectedSongIds,
    );
  }

  @override
  List<Object?> get props => [songs, isSelectionMode, selectedSongIds];
}

class LibraryDeleting extends LibraryState {
  final bool completed;
  const LibraryDeleting({this.completed = false});
  @override
  List<Object?> get props => [completed];
}

class LibraryError extends LibraryState {
  final String message;
  const LibraryError({required this.message});
  @override
  List<Object?> get props => [message];
}
