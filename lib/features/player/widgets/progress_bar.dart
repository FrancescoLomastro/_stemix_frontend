import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';

Widget buildProgressBar(BuildContext context, PlayerLoaded state) {
  final duration = context.read<PlayerBloc>().song.duration;
  final durationFormatted =
      "${(duration / 60).floor()}:${(duration % 60).toString().padLeft(2, '0')}";
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Slider(
                padding: EdgeInsets.zero,
                value: 50.0,
                min: 0.0,
                max: duration.toDouble(),
                onChanged: (value) {
                  // Handle slider change
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("0:00"), Text(durationFormatted)],
        ),
        SizedBox(height: 8),
        StreamBuilder(
          stream: context.read<PlayerBloc>().player.positionStream,
          builder: (context, snapshot) {
            return Text(
              "Current Position: 0:${(snapshot.data ?? 0).toString().padLeft(2, '0')}",
            );
          },
        ),
      ],
    ),
  );
}
