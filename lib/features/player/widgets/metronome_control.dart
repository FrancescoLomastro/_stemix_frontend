import 'package:flutter/material.dart'; /* 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart'; */
import 'package:stemix_frontend/features/player/bloc/player_state.dart';
import 'package:stemix_frontend/features/player/widgets/audio_control.dart';

Widget buildMetronomeControls(BuildContext context, PlayerLoaded state) {
  return buildAudioControl(context, state, null);
}
