import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/features/player/audio/soloud_audio.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';

@injectable
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final Song song;
  PlayerBloc(@factoryParam this.song) : super(PlayerState()) {
    SoloudImplementation player = SoloudImplementation();
    player.initialize();

    on<LoadPlayer>((event, emit) async {
      emit(PlayerLoading());
      await player.loadTracks(song);
      emit(PlayerLoaded());
    });

    on<Play>((event, emit) {
      player.play();
    });

    on<Pause>((event, emit) {
      player.pause();
    });
  }
}
