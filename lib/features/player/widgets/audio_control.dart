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
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        buildAudioControl(context, state, StemName.vocals),
        SizedBox(height: 10),
        buildAudioControl(context, state, StemName.drums),
        SizedBox(height: 10),
        buildAudioControl(context, state, StemName.guitar),
        SizedBox(height: 10),
        buildAudioControl(context, state, StemName.bass),
        SizedBox(height: 10),
        buildAudioControl(context, state, StemName.piano),
        SizedBox(height: 10),
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
  final label = stemName != null
      ? "${stemName.name[0].toUpperCase()}${stemName.name.substring(1)}"
      : "Metronome";
  final volume = stemName != null
      ? state.stemVolumes[stemName]!
      : state.metronomeVolume;
  final percentage = (volume * 100).round();
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                stemName != null ? getStemIcon(stemName) : Icons.timer_outlined,
                size: 24,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              GestureDetector(
                child: IconButton(
                  icon: Icon(
                    volume > 0
                        ? Icons.volume_up_rounded
                        : Icons.volume_off_rounded,
                    color: volume > 0
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurfaceVariant,
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
