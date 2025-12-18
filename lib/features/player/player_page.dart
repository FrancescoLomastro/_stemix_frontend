import 'package:flutter/material.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';

class PlayerPage extends StatelessWidget {
  final Song song;
  const PlayerPage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Player Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('CoverPath: ${song.coverPath}'),
            Text('VocalStemPath: ${song.pathVocals}'),
            Text('BassStemPath: ${song.pathBass}'),
            Text('DrumsStemPath: ${song.pathDrums}'),
            Text('OtherStemPath: ${song.pathOther}'),
            Text('PianoStemPath: ${song.pathPiano}'),
            Text('GuitarStemPath: ${song.pathGuitar}'),

            TextButton(onPressed: () {}, child: const Text('Play')),
          ],
        ),
      ),
    );
  }
}
