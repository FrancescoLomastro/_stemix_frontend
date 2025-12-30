import 'package:flutter/material.dart'; /* 
import 'package:flutter_bloc/flutter_bloc.dart'; */
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/data/local/drift/stem_names.dart'; /* 
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart'; */
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';

Widget buildStemsControls(BuildContext context, PlayerLoaded state) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Theme.of(context).colorScheme.outline,
        width: 1.5,
      ),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        buildAudioControl(context, state, StemName.vocals),
        Divider(),
        buildAudioControl(context, state, StemName.drums),
        Divider(),
        buildAudioControl(context, state, StemName.guitar),
        Divider(),
        buildAudioControl(context, state, StemName.bass),
        Divider(),
        buildAudioControl(context, state, StemName.piano),
        Divider(),
        buildAudioControl(context, state, StemName.other),
      ],
    ),
  );
}

Widget buildAudioControl(
  BuildContext context,
  PlayerLoaded state,
  StemName? stemName,
) {
  final label = stemName != null ? stemName.name : "Metronome";
  final volume = stemName != null
      ? state.stemVolumes[stemName]!
      : state.metronomeVolume;
  final percentage = (volume * 100).round();
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                stemName != null ? getStemIcon(stemName) : Icons.timer_outlined,
                size: 24,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(label)),
            GestureDetector(
              child: IconButton(
                icon: Icon(
                  volume > 0
                      ? Icons.volume_up_rounded
                      : Icons.volume_off_rounded,
                  /* color: AppTheme.defaultWhite, */
                  size: 28,
                ),
                onPressed: () {
                  context.read<PlayerBloc>().add(
                    SetVolumeEvent(stemName, volume > 0 ? 0.0 : 1.0),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Slider(
                padding: EdgeInsets.zero,
                min: 0.0,
                max: 1.0,
                value: volume,
                onChanged: (value) {
                  context.read<PlayerBloc>().add(
                    SetVolumeEvent(stemName, value),
                  );
                },
              ),
            ),
            SizedBox(width: 40),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
              child: Text("$percentage%", textAlign: TextAlign.center),
            ),
          ],
        ),
        if (stemName == null) ...[
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSpeedOption(context, state, MetronomeSpeed.half, "0.5x"),
              const SizedBox(width: 10),
              _buildSpeedOption(context, state, MetronomeSpeed.normal, "1x"),
              const SizedBox(width: 10),
              _buildSpeedOption(context, state, MetronomeSpeed.double, "2x"),
            ],
          ),
        ],
      ],
    ),
  );
}

Widget _buildSpeedOption(
  BuildContext context,
  PlayerLoaded state,
  MetronomeSpeed value,
  String label,
) {
  final isSelected = state.metronomeSpeed == value;
  return GestureDetector(
    onTap: () {
      context.read<PlayerBloc>().add(SetMetronomeSpeedEvent(value));
    },
    child: Container(
      width: 70,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 1.5,
        ),
        color: isSelected ? Theme.of(context).colorScheme.primary : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(label, textAlign: TextAlign.center),
    ),
  );
}
