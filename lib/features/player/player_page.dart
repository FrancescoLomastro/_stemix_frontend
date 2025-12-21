import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart';
import 'package:stemix_frontend/features/player/bloc/player_event.dart';
import 'package:stemix_frontend/features/player/bloc/player_state.dart';
import 'package:stemix_frontend/features/player/widgets/playback_control.dart';
import 'package:stemix_frontend/features/player/widgets/progress_bar.dart';
import 'package:stemix_frontend/features/player/widgets/song_info.dart';
import 'package:stemix_frontend/features/player/widgets/stems_control.dart';

class PlayerPage extends StatelessWidget {
  final Song song;
  const PlayerPage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PlayerBloc>(param1: song)..add(LoadPlayerEvent()),
      child: _PlayerView(),
    );
  }
}

class _PlayerView extends StatelessWidget {
  const _PlayerView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlayerBloc, PlayerState>(
      listenWhen: (previous, current) => current is PlayerError,
      listener: (context, state) {
        if (state is PlayerError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
        }
      },
      child: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (BuildContext context, PlayerState state) {
          if (state is PlayerLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is PlayerLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Player Page'),
                actions: [
                  IconButton(
                    icon: state.isSaved
                        ? const Icon(Icons.save)
                        : const Icon(Icons.save_outlined),
                    onPressed: () {
                      context.read<PlayerBloc>().add(
                        SaveEvent(stemVolumes: state.stemVolumes),
                      );
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                physics: const PageScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSongInfo(context, state),
                    const SizedBox(height: 30),
                    buildProgressBar(context, state),
                    const SizedBox(height: 5),
                    buildPlayBackControls(context, state),
                    const SizedBox(height: 40),
                    buildStemsControls(context, state),
                  ],
                ),
              ),
            );
          } else if (state is PlayerError) {
            return Scaffold(
              body: Center(child: Text('Error: ${state.message}')),
            );
          } else {
            return const Scaffold(body: Center(child: Text('Unknown state')));
          }
        },
      ),
    );
  }
}
