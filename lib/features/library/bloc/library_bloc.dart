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
  }

  void _onToggleSongSelection(
    ToggleSongSelectionEvent event,
    Emitter<LibraryState> emit,
  ) {
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
  }

  void _onToggleSelectionMode(
    ToggleSelectionModeEvent event,
    Emitter<LibraryState> emit,
  ) {
    if (state is LibraryLoaded) {
      final currentState = state as LibraryLoaded;
      emit(
        currentState.copyWith(
          isSelectionMode: !currentState.isSelectionMode,
          selectedSongIds: const {},
        ),
      );
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
      logger.e("LibraryBloc - _onLoadSongs error: $e, $stackTrace");
      emit(LibraryError(message: "Error loading songs: ${e.toString()}"));
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
        logger.e("LibraryBloc - _onDeleteSelected error: $e, $stackTrace");
        emit(LibraryError(message: "Error deleting songs: ${e.toString()}"));
      } finally {
        emit(LibraryDeleting(completed: true));
        add(LoadSongsEvent());
      }
    }
  }
}
