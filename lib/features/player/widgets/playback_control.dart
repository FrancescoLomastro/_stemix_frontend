import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';

Widget buildPlayBackControls(BuildContext context, PlayerLoaded state) {
  final skipForwardAmount = 10;
  final skipBackwardAmount = -10;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        icon: const Icon(Icons.replay_10),
        iconSize: 40,
        onPressed: () => context.read<PlayerBloc>().add(
          SkipDurationEvent(amount: skipBackwardAmount),
        ),
        color: Theme.of(context).colorScheme.onSurface,
      ),

      SizedBox(width: 20),

      GestureDetector(
        onTap: () {
          state.isPlaying
              ? context.read<PlayerBloc>().add(PauseEvent())
              : context.read<PlayerBloc>().add(PlayEvent());
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          child: Icon(
            state.isPlaying ? Icons.pause : Icons.play_arrow,
            size: state.isPlaying ? 50 : 60,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),

      SizedBox(width: 20),

      IconButton(
        icon: const Icon(Icons.forward_10),
        iconSize: 40,
        onPressed: () => context.read<PlayerBloc>().add(
          SkipDurationEvent(amount: skipForwardAmount),
        ),
        color: Theme.of(context).colorScheme.onSurface,
      ),
    ],
  );
}
