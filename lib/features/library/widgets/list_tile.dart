import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/theme/widgets/default_image_placeholder.dart';

class SongListTile extends StatelessWidget {
  final Song song;

  const SongListTile({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              _buildCoverImage(),
              const SizedBox(width: 14),
              _buildSongInfo(context),
            ],
          ),
        ),
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
}
