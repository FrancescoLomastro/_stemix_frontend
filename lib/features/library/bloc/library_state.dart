part of 'library_bloc.dart';

enum LibraryStatus { initial, loading, success, failure, deleting }

class LibraryState extends Equatable {
  final LibraryStatus status;
  final List<Song> songs;
  final bool isSelectionMode;
  final Set<int> selectedSongIds;
  final String? errorMessage;

  const LibraryState({
    this.status = LibraryStatus.initial,
    this.songs = const [],
    this.isSelectionMode = false,
    this.selectedSongIds = const {},
    this.errorMessage,
  });

  LibraryState copyWith({
    LibraryStatus? status,
    List<Song>? songs,
    bool? isSelectionMode,
    Set<int>? selectedSongIds,
    String? errorMessage,
  }) {
    return LibraryState(
      status: status ?? this.status,
      songs: songs ?? this.songs,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      selectedSongIds: selectedSongIds ?? this.selectedSongIds,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    songs,
    isSelectionMode,
    selectedSongIds,
    errorMessage,
  ];
}
