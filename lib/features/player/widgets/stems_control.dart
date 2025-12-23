import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/stem_names.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';
import 'package:stemix_frontend/theme/app_theme.dart';

Widget buildStemsControls(BuildContext context, PlayerLoaded state) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppTheme.defaultWhite, width: 1.5),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        buildStemControl(context, state, StemName.vocals),
        Divider(color: AppTheme.defaultWhite, height: 0.5),
        buildStemControl(context, state, StemName.drums),
        Divider(color: AppTheme.defaultWhite, height: 0.5),
        buildStemControl(context, state, StemName.guitar),
        Divider(color: AppTheme.defaultWhite, height: 0.5),
        buildStemControl(context, state, StemName.bass),
        Divider(color: AppTheme.defaultWhite, height: 0.5),
        buildStemControl(context, state, StemName.piano),
        Divider(color: AppTheme.defaultWhite, height: 0.5),
        buildStemControl(context, state, StemName.other),
      ],
    ),
  );
}

Widget buildStemControl(
  BuildContext context,
  PlayerLoaded state,
  StemName stemName,
) {
  final volume = state.stemVolumes[stemName]!;
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
              child: Icon(
                Icons.volcano,
                size: 28,
                color: AppTheme.defaultWhite,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(stemName.name)),
            GestureDetector(
              child: IconButton(
                icon: Icon(
                  volume > 0
                      ? Icons.volume_up_rounded
                      : Icons.volume_off_rounded,
                  color: AppTheme.defaultWhite,
                  size: 28,
                ),
                onPressed: () => context.read<PlayerBloc>().add(
                  SetVolumeEvent(stemName, volume > 0 ? 0.0 : 1.0),
                ),
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
                onChanged: (value) => context.read<PlayerBloc>().add(
                  SetVolumeEvent(stemName, value),
                ),
              ),
            ),
            SizedBox(width: 40),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
              child: Text("$percentage%", textAlign: TextAlign.center),
            ),
          ],
        ),
      ],
    ),
  );
}
