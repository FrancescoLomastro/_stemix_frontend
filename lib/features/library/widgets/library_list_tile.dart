import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart';
import 'package:stemix_frontend/widgets/default_image_placeholder.dart';

class SongListTile extends StatelessWidget {
  final Song song;
  final bool isSelected;
  final bool isSelectionMode;

  const SongListTile({
    super.key,
    required this.song,
    required this.isSelected,
    required this.isSelectionMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _handleTap(context),
        onLongPress: () => _handleLongPress(context),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              if (isSelectionMode) _buildCheckbox(context),
              _buildCoverImage(60),
              const SizedBox(width: 14),
              _buildSongInfo(context),
              _buildSongDuration(context),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleTap(BuildContext context) async {
    if (isSelectionMode) {
      context.read<LibraryBloc>().add(ToggleSongSelectionEvent(song.id));
    } else {
      await context.push<bool>('/player', extra: song);
      /*
      if (shouldRefresh == true && context.mounted) {
        context.read<LibraryBloc>().add(LoadSongsEvent());
      } */
    }
  }

  Widget _buildCheckbox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Checkbox(
        value: isSelected,
        onChanged: (val) {
          context.read<LibraryBloc>().add(ToggleSongSelectionEvent(song.id));
        },
      ),
    );
  }

  Widget _buildCoverImage(double size) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      child: song.coverPath != null
          ? Image.file(
              File(song.coverPath!),
              width: size,
              height: size,
              fit: BoxFit.contain,
            )
          : DefaultImagePlaceholder(size: size),
    );
  }

  Widget _buildSongInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(song.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            song.artist,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  void _handleLongPress(BuildContext context) {
    if (!isSelectionMode) {
      context.read<LibraryBloc>().add(ToggleSelectionModeEvent());
      context.read<LibraryBloc>().add(ToggleSongSelectionEvent(song.id));
    }
  }

  Widget _buildSongDuration(BuildContext context) {
    final duration = Duration(seconds: song.duration);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    final durationStr =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Text(
      durationStr,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
