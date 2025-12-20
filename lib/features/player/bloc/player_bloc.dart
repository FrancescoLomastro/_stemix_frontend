import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/local/repository/song_repository.dart';
import 'package:stemix_frontend/data/local/stem_names.dart';
import 'package:stemix_frontend/features/player/audio/soloud_audio.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';
import 'package:stemix_frontend/main.dart';

@injectable
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final Song song;
  final SoloudImplementation player;
  final SongRepository _songRepository;

  PlayerBloc(this.player, this._songRepository, @factoryParam this.song)
    : super(PlayerState()) {
    on<LoadPlayerEvent>(_onLoadPlayerEvent);
    on<PlayEvent>(_onPlayEvent);
    on<PauseEvent>(_onPauseEvent);
    on<SkipDurationEvent>(_onSkipDurationEvent);
    on<SetVolumeEvent>(_onSetVolumeEvent);
    on<SaveEvent>(_onSaveEvent);
  }

  Future<void> _onLoadPlayerEvent(
    LoadPlayerEvent event,
    Emitter<PlayerState> emit,
  ) async {
    try {
      emit(PlayerLoading());
      await player.ensureInitialized();
      await player.ensureCleanedUp();
      await player.loadTracks(song);
      emit(
        PlayerLoaded(
          isSaved: true,
          stemVolumes: {
            StemName.vocals: song.vocalsVol,
            StemName.bass: song.bassVol,
            StemName.drums: song.drumsVol,
            StemName.other: song.otherVol,
            StemName.piano: song.pianoVol,
            StemName.guitar: song.guitarVol,
          },
        ),
      );
    } catch (e) {
      logger.e("Error loading player: $e");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onPlayEvent(PlayEvent event, Emitter<PlayerState> emit) async {
    try {
      final currentState = state;
      if (currentState is PlayerLoaded) {
        if (!currentState.isPlaying) {
          player.play();
          emit(
            PlayerLoaded(
              isPlaying: true,
              stemVolumes: currentState.stemVolumes,
            ),
          );
        }
      }
    } catch (e) {
      logger.e("Error in PlayEvent: $e");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onPauseEvent(
    PauseEvent event,
    Emitter<PlayerState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is PlayerLoaded) {
        if (currentState.isPlaying) {
          player.pause();
          emit(
            PlayerLoaded(
              isPlaying: false,
              stemVolumes: currentState.stemVolumes,
            ),
          );
        }
      }
    } catch (e) {
      logger.e("Error in PauseEvent: $e");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onSkipDurationEvent(
    SkipDurationEvent event,
    Emitter<PlayerState> emit,
  ) async {
    try {
      final songDuration = song.duration;
      if (event.absolute) {
        // Handles absolute seek
        if (event.amount < 0) return;
        if (event.amount > songDuration) return;
        player.seek(Duration(seconds: event.amount));
      } else {
        // Handles relative seek
        final currentPosition = player.currentPosition;
        Duration newPosition =
            currentPosition + Duration(seconds: event.amount);
        bool changeUi = false;

        if (newPosition < Duration.zero) {
          newPosition = Duration.zero;
        } else if (newPosition.inSeconds > songDuration) {
          newPosition = Duration.zero;
          player.pause();
          changeUi = true;
        }
        player.seek(newPosition);

        // its important to change the UI only after seeking the player
        if (changeUi) {
          emit(PlayerLoaded(isPlaying: false));
        }
      }
    } catch (e) {
      logger.e("Error in SkipDurationEvent: $e");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onSetVolumeEvent(
    SetVolumeEvent event,
    Emitter<PlayerState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is PlayerLoaded) {
        player.setVolume(event.stemName, event.volume);
        final newVolumes = Map<StemName, double>.from(currentState.stemVolumes);
        newVolumes[event.stemName] = event.volume;
        emit(currentState.copyWith(stemVolumes: newVolumes, isSaved: false));
      }
    } catch (e) {
      logger.e("Error in SetVolumeEvent: $e");
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onSaveEvent(SaveEvent event, Emitter<PlayerState> emit) async {
    try {
      final currentState = state;
      if (currentState is PlayerLoaded) {
        await _songRepository.updateSong(song.id, event.stemVolumes);
        emit(currentState.copyWith(isSaved: true));
        logger.i("Song volumes saved successfully.");
      }
    } catch (e) {
      logger.e("Error in SaveEvent: $e");
      emit(PlayerError(e.toString()));
    }
  }
}
