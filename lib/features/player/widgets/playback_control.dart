import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';
import 'package:stemix_frontend/theme/app_theme.dart';

Widget buildPlayBackControls(BuildContext context, PlayerLoaded state) {
  final skipForwardAmount = 10;
  final skipBackwardAmount = -10;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          IconButton(
            icon: const Icon(Icons.skip_previous_rounded),
            iconSize: 42,
            color: AppTheme.defaultWhite,
            onPressed: () => context.read<PlayerBloc>().add(
              SkipDurationEvent(amount: skipBackwardAmount),
            ),
          ),
          Text(
            "${skipBackwardAmount}s",
            style: TextStyle(
              color: AppTheme.defaultWhite,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
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
            color: AppTheme.defaultWhite,
          ),
          child: Icon(
            state.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            size: 42,
            color: AppTheme.defaultBlack,
          ),
        ),
      ),

      SizedBox(width: 20),

      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.skip_next_rounded),
            iconSize: 42,
            color: AppTheme.defaultWhite,
            onPressed: () => context.read<PlayerBloc>().add(
              SkipDurationEvent(amount: skipForwardAmount),
            ),
          ),
          Text(
            "+${skipForwardAmount}s",
            style: TextStyle(
              color: AppTheme.defaultWhite,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ],
  );
}
