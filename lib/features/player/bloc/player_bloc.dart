import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/features/player/audio/soloud_audio.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';

@injectable
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final Song song;
  final SoloudImplementation player;

  PlayerBloc(this.player, @factoryParam this.song) : super(PlayerState()) {
    on<LoadPlayerEvent>((event, emit) async {
      emit(PlayerLoading());
      await player.ensureInitialized();
      await player.ensureCleanedUp();
      await player.loadTracks(song);
      emit(PlayerLoaded());
    });

    on<PlayEvent>((event, emit) {
      final currentState = state;
      if (currentState is PlayerLoaded && currentState.isPlaying) {
        return;
      }

      player.play();
      emit(PlayerLoaded(isPlaying: true));
    });

    on<PauseEvent>((event, emit) {
      final currentState = state;
      if (currentState is PlayerLoaded && !currentState.isPlaying) {
        return;
      }

      player.pause();
      emit(PlayerLoaded(isPlaying: false));
    });

    on<SkipDurationEvent>((event, emit) async {
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
    });
  }
}
