import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/local/repository/song_repository.dart';
import 'package:stemix_frontend/main.dart';

part 'library_event.dart';
part 'library_state.dart';

@injectable
class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final SongRepository _songRepository;

  LibraryBloc(this._songRepository) : super(LibraryLoading()) {
    on<LoadSongsEvent>(_onLoadSongs);
    on<ToggleSelectionModeEvent>(_onToggleSelectionMode);
    on<ToggleSongSelectionEvent>(_onToggleSongSelection);
    on<DeleteSelectedSongsEvent>(_onDeleteSelected);
    on<SelectAllEvent>(_onSelectAll);
  }

  void _onToggleSongSelection(
    ToggleSongSelectionEvent event,
    Emitter<LibraryState> emit,
  ) {
    try {
      if (state is LibraryLoaded) {
        final currentState = state as LibraryLoaded;
        final newSelection = Set<int>.from(currentState.selectedSongIds);

        if (newSelection.contains(event.songId)) {
          newSelection.remove(event.songId);
        } else {
          newSelection.add(event.songId);
        }

        emit(currentState.copyWith(selectedSongIds: newSelection));
      }
    } catch (e, stackTrace) {
      String message =
          "_onToggleSongSelection error: ${e.toString()}, stackTrace: $stackTrace";
      logger.e(message);
      emit(LibraryError(message: message));
    }
  }

  void _onToggleSelectionMode(
    ToggleSelectionModeEvent event,
    Emitter<LibraryState> emit,
  ) {
    try {
      if (state is LibraryLoaded) {
        final currentState = state as LibraryLoaded;
        emit(
          currentState.copyWith(
            isSelectionMode: !currentState.isSelectionMode,
            selectedSongIds: const {},
          ),
        );
      }
    } catch (e, stackTrace) {
      String message =
          "_onToggleSelectionMode error: ${e.toString()}, stackTrace: $stackTrace";
      logger.e(message);
      emit(LibraryError(message: message));
    }
  }

  Future<void> _onLoadSongs(
    LoadSongsEvent event,
    Emitter<LibraryState> emit,
  ) async {
    try {
      emit(LibraryLoading());
      final songs = await _songRepository.getAllSongs();
      emit(LibraryLoaded(songs: songs));
    } catch (e, stackTrace) {
      String message =
          "_onLoadSongs error: ${e.toString()}, stackTrace: $stackTrace";
      logger.e(message);
      emit(LibraryError(message: message));
    }
  }

  Future<void> _onDeleteSelected(
    DeleteSelectedSongsEvent event,
    Emitter<LibraryState> emit,
  ) async {
    if (state is LibraryLoaded) {
      final currentState = state as LibraryLoaded;
      if (currentState.selectedSongIds.isEmpty) return;

      emit(LibraryDeleting(completed: false));
      try {
        await _songRepository.deleteSongs(
          currentState.selectedSongIds.toList(),
        );
      } catch (e, stackTrace) {
        String message =
            "_onDeleteSelected error: ${e.toString()}, stackTrace: $stackTrace";
        logger.e(message);
        emit(LibraryError(message: message));
      } finally {
        emit(LibraryDeleting(completed: true));
        add(LoadSongsEvent());
      }
    }
  }

  void _onSelectAll(SelectAllEvent event, Emitter<LibraryState> emit) {
    if (state is LibraryLoaded) {
      try {
        final currentState = state as LibraryLoaded;
        if (event.isSelect) {
          final allIds = currentState.songs.map((s) => s.id).toSet();
          emit(currentState.copyWith(selectedSongIds: allIds));
        } else {
          emit(currentState.copyWith(selectedSongIds: {}));
        }
      } catch (e, stackTrace) {
        String message =
            "_onSelectAll error: ${e.toString()}, stackTrace: $stackTrace";
        logger.e(message);
        emit(LibraryError(message: message));
      }
    }
  }
}
