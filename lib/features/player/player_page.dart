import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';

class PlayerPage extends StatelessWidget {
  final Song song;
  const PlayerPage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PlayerBloc>(param1: song)..add(LoadPlayer()),
      child: _PlayerView(song: song),
    );
  }
}

class _PlayerView extends StatelessWidget {
  final Song song;
  const _PlayerView({required this.song});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (BuildContext context, PlayerState state) {
        if (state is PlayerLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
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

                  TextButton(
                    onPressed: () {
                      context.read<PlayerBloc>().add(Play());
                    },
                    child: const Text('Play'),
                  ),

                  TextButton(
                    onPressed: () {
                      context.read<PlayerBloc>().add(Pause());
                    },
                    child: const Text('Pause'),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
