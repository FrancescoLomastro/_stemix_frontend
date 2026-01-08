import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/remote/song_repository.dart';
import 'package:stemix_frontend/logger.dart';

part 'library_event.dart';
part 'library_state.dart';

@injectable
class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final SongRepository _songRepository;

  LibraryBloc(this._songRepository) : super(LibraryState()) {
    on<LoadSongsEvent>(_onLoadSongs);
    on<ToggleSelectionModeEvent>(_onToggleSelectionMode);
    on<ToggleSongSelectionEvent>(_onToggleSongSelection);
    on<DeleteSelectedSongsEvent>(_onDeleteSelected);
    on<SelectAllEvent>(_onSelectAll);
    on<ChangeSortOrderEvent>(_onChangeSortOrder);
  }

  // Nuovo Handler per il cambio ordine
  void _onChangeSortOrder(
    ChangeSortOrderEvent event,
    Emitter<LibraryState> emit,
  ) {
    final sortedSongs = _sortSongs(
      state.songs,
      event.sortOption,
      event.sortDirection,
    );

    emit(
      state.copyWith(
        sortOption: event.sortOption,
        sortDirection: event.sortDirection,
        songs: sortedSongs,
      ),
    );
  }

  void _onToggleSongSelection(
    ToggleSongSelectionEvent event,
    Emitter<LibraryState> emit,
  ) {
    try {
      final newSelection = Set<int>.from(state.selectedSongIds);

      if (newSelection.contains(event.songId)) {
        newSelection.remove(event.songId);
      } else {
        newSelection.add(event.songId);
      }

      emit(state.copyWith(selectedSongIds: newSelection));
    } catch (e, stackTrace) {
      String message =
          "_onToggleSongSelection error: ${e.toString()}, stackTrace: $stackTrace";
      logger.e(message);
      emit(
        state.copyWith(status: LibraryStatus.failure, errorMessage: message),
      );
    }
  }

  void _onToggleSelectionMode(
    ToggleSelectionModeEvent event,
    Emitter<LibraryState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          isSelectionMode: !state.isSelectionMode,
          selectedSongIds: const {},
        ),
      );
    } catch (e, stackTrace) {
      String message =
          "_onToggleSelectionMode error: ${e.toString()}, stackTrace: $stackTrace";
      logger.e(message);
      emit(
        state.copyWith(status: LibraryStatus.failure, errorMessage: message),
      );
    }
  }

  Future<void> _onLoadSongs(
    LoadSongsEvent event,
    Emitter<LibraryState> emit,
  ) async {
    emit(state.copyWith(status: LibraryStatus.loading));
    try {
      final songs = await _songRepository.getAllSongs();
      final sortedSongs = _sortSongs(
        songs,
        state.sortOption,
        state.sortDirection,
      );

      emit(LibraryState(status: LibraryStatus.success, songs: sortedSongs));
    } catch (e, stackTrace) {
      String message =
          "_onLoadSongs error: ${e.toString()}, stackTrace: $stackTrace";
      logger.e(message);
      emit(
        state.copyWith(status: LibraryStatus.failure, errorMessage: message),
      );
    }
  }

  Future<void> _onDeleteSelected(
    DeleteSelectedSongsEvent event,
    Emitter<LibraryState> emit,
  ) async {
    if (state.selectedSongIds.isEmpty) return;

    emit(state.copyWith(status: LibraryStatus.deleting));
    try {
      await _songRepository.deleteSongs(state.selectedSongIds.toList());
      add(LoadSongsEvent());
    } catch (e, stackTrace) {
      String message =
          "_onDeleteSelected error: ${e.toString()}, stackTrace: $stackTrace";
      emit(
        state.copyWith(status: LibraryStatus.failure, errorMessage: message),
      );
    }
  }

  void _onSelectAll(SelectAllEvent event, Emitter<LibraryState> emit) {
    try {
      if (event.isSelect) {
        final allIds = state.songs.map((s) => s.id).toSet();
        emit(state.copyWith(selectedSongIds: allIds));
      } else {
        emit(state.copyWith(selectedSongIds: const {}));
      }
    } catch (e, stackTrace) {
      String message =
          "_onSelectAll error: ${e.toString()}, stackTrace: $stackTrace";
      logger.e(message);
      emit(
        state.copyWith(status: LibraryStatus.failure, errorMessage: message),
      );
    }
  }

  List<Song> _sortSongs(
    List<Song> songs,
    SortOption option,
    SortDirection direction,
  ) {
    // Creiamo una copia modificabile della lista
    final List<Song> sorted = List.from(songs);

    int compareResult;
    sorted.sort((a, b) {
      switch (option) {
        case SortOption.title:
          compareResult = a.title.toLowerCase().compareTo(
            b.title.toLowerCase(),
          );
          break;
        case SortOption.artist:
          compareResult = a.artist.toLowerCase().compareTo(
            b.artist.toLowerCase(),
          );
          break;
        case SortOption.date:
          compareResult = a.createdAt.compareTo(b.createdAt);
          break;
      }
      return direction == SortDirection.ascending
          ? compareResult
          : -compareResult;
    });

    return sorted;
  }
}
