import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';
import 'package:stemix_frontend/theme/app_theme.dart';

class PlayerPage extends StatelessWidget {
  final Song song;
  const PlayerPage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PlayerBloc>(param1: song)..add(LoadPlayerEvent()),
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
        } else if (state is PlayerLoaded) {
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
                  _buildPlayBackControls(context, state),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(body: Center(child: Text('Unknown state')));
        }
      },
    );
  }

  Widget _buildPlayBackControls(BuildContext context, PlayerLoaded state) {
    final skipForwardAmount = 10;
    final skipBackwardAmount = -10;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.skip_previous_rounded),
              iconSize: 42,
              color: AppTheme.defaultWhite,
              onPressed: () => context.read<PlayerBloc>().add(
                SkipDurationEvent(amount: skipBackwardAmount),
              ),
            ),
            Text(
              "${skipBackwardAmount}s",
              style: TextStyle(
                color: AppTheme.defaultWhite,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        SizedBox(width: 20),

        GestureDetector(
          onTap: () {
            state.isPlaying
                ? context.read<PlayerBloc>().add(PauseEvent())
                : context.read<PlayerBloc>().add(PlayEvent());
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.defaultWhite,
            ),
            child: Icon(
              state.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              size: 42,
              color: AppTheme.defaultBlack,
            ),
          ),
        ),

        SizedBox(width: 20),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.skip_next_rounded),
              iconSize: 42,
              color: AppTheme.defaultWhite,
              onPressed: () => context.read<PlayerBloc>().add(
                SkipDurationEvent(amount: skipForwardAmount),
              ),
            ),
            Text(
              "+${skipForwardAmount}s",
              style: TextStyle(
                color: AppTheme.defaultWhite,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
