import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerState()) {
    on<PlayerEvent>((event, emit) {});
  }
}
