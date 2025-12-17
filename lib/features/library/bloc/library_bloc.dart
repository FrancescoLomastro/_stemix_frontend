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
}
