import 'package:flutter/material.dart'; /* 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart'; */
import 'package:stemix_frontend/features/player/bloc/player_state.dart';
import 'package:stemix_frontend/features/player/widgets/audio_control.dart';

Widget buildMetronomeControls(BuildContext context, PlayerLoaded state) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Theme.of(context).colorScheme.outline,
        width: 1.5,
      ),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: buildAudioControl(context, state, null),
  );
}
