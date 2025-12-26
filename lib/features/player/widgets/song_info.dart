import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';
import 'package:stemix_frontend/widgets/default_image_placeholder.dart';

Widget buildSongInfo(BuildContext context, PlayerLoaded state) {
  final song = context.read<PlayerBloc>().song;

  return Column(
    children: [
      _buildSongCover(300, song.coverPath),
      const SizedBox(height: 20),
      Text(
        song.title,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 2),
      Text(
        song.artist,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}

Widget _buildSongCover(double size, String? coverPath) {
  return Container(
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
    child: coverPath != null
        ? Image.file(
            File(coverPath),
            width: size,
            height: size,
            fit: BoxFit.cover,
          )
        : DefaultImagePlaceholder(size: size),
  );
}
