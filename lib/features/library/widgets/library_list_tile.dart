import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart';
import 'package:stemix_frontend/theme/widgets/default_image_placeholder.dart';

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
              _buildCoverImage(),
              const SizedBox(width: 14),
              _buildSongInfo(context),
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
      /* final bool? shouldRefresh = await context.push<bool>(
        '/player',
        extra: song,
      );

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

  Widget _buildCoverImage() {
    return song.coverPath != null
        ? Image.file(
            File(song.coverPath!),
            width: 60,
            height: 60,
            fit: BoxFit.contain,
          )
        : const DefaultImagePlaceholder(size: 60);
  }

  Widget _buildSongInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(song.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(song.artist, style: Theme.of(context).textTheme.titleMedium),
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
}
