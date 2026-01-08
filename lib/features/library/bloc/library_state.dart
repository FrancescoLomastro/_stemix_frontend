part of 'library_bloc.dart';

enum LibraryStatus { initial, loading, success, failure, deleting }

enum SortOption { date, title, artist }

enum SortDirection { ascending, descending }

class LibraryState extends Equatable {
  final LibraryStatus status;
  final List<Song> songs;
  final bool isSelectionMode;
  final Set<int> selectedSongIds;
  final String? errorMessage;
  final SortOption sortOption;
  final SortDirection sortDirection;

  const LibraryState({
    this.status = LibraryStatus.initial,
    this.songs = const [],
    this.isSelectionMode = false,
    this.selectedSongIds = const {},
    this.errorMessage,
    this.sortOption = SortOption.date,
    this.sortDirection = SortDirection.descending,
  });

  LibraryState copyWith({
    LibraryStatus? status,
    List<Song>? songs,
    bool? isSelectionMode,
    Set<int>? selectedSongIds,
    String? errorMessage,
    SortOption? sortOption,
    SortDirection? sortDirection,
  }) {
    return LibraryState(
      status: status ?? this.status,
      songs: songs ?? this.songs,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      selectedSongIds: selectedSongIds ?? this.selectedSongIds,
      sortOption: sortOption ?? this.sortOption,
      sortDirection: sortDirection ?? this.sortDirection,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    songs,
    isSelectionMode,
    selectedSongIds,
    sortOption,
    sortDirection,
    errorMessage,
  ];
}
