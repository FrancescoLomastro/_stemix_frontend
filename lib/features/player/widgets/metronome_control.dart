import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';

Widget buildMetronomeControls(BuildContext context, PlayerLoaded state) {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSpeedOption(context, state, MetronomeSpeed.half),
            const SizedBox(width: 10),
            _buildSpeedOption(context, state, MetronomeSpeed.normal),
            const SizedBox(width: 10),
            _buildSpeedOption(context, state, MetronomeSpeed.double),
          ],
        ),
        Switch(
          value: state.isMetronomeEnabled,
          onChanged: (value) {
            context.read<PlayerBloc>().add(ToggleMetronomeEvent());
          },
        ),
      ],
    ),
  );
}

Widget _buildSpeedOption(
  BuildContext context,
  PlayerLoaded state,
  MetronomeSpeed value,
) {
  final isSelected = state.metronomeSpeed == value;
  return GestureDetector(
    onTap: () {
      context.read<PlayerBloc>().add(SetMetronomeSpeedEvent(value));
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Text(value.name.toUpperCase()),
      ),
    ),
  );
}
