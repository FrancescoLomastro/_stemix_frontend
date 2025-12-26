import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';
import 'package:stemix_frontend/theme/icons/custom_icons_icons.dart';

Widget buildPlayBackControls(BuildContext context, PlayerLoaded state) {
  final skipForwardAmount = 10;
  final skipBackwardAmount = -10;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          IconButton(
            icon: const Icon(CustomIcons.skip_left),
            iconSize: 30,
            onPressed: () => context.read<PlayerBloc>().add(
              SkipDurationEvent(amount: skipBackwardAmount),
            ),
          ),
          Text(
            "${skipBackwardAmount}s",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Padding(
            padding: state.isPlaying
                ? EdgeInsets.zero
                : const EdgeInsets.only(left: 3.0),
            child: Icon(
              state.isPlaying ? CustomIcons.pause : CustomIcons.play,
              size: 35,
            ),
          ),
        ),
      ),

      SizedBox(width: 20),

      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(CustomIcons.skip_right),
            iconSize: 30,
            onPressed: () => context.read<PlayerBloc>().add(
              SkipDurationEvent(amount: skipForwardAmount),
            ),
          ),
          Text(
            "+${skipForwardAmount}s",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ],
  );
}
