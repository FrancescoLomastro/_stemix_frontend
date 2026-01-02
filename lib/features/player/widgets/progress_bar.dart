import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';

String formatDuration(int seconds) {
  final minutes = (seconds / 60).floor();
  final remainingSeconds = seconds % 60;
  return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
}

Widget buildProgressBar(BuildContext context, PlayerLoaded state) {
  final duration = context.read<PlayerBloc>().song.duration;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: StreamBuilder(
      stream: context.read<PlayerBloc>().positionStream,
      builder: (context, snapshot) {
        final positionValue = snapshot.data ?? 0;
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Slider(
                    padding: EdgeInsets.zero,
                    value: positionValue.toDouble(),
                    min: 0.0,
                    max: duration.toDouble(),
                    onChanged: (value) {
                      context.read<PlayerBloc>().add(
                        SkipDurationEvent(
                          absolute: true,
                          amount: value.toInt(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatDuration(positionValue)),
                Text(formatDuration(duration)),
              ],
            ),
          ],
        );
      },
    ),
  );
}
