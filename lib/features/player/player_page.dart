import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/data/local/stem_names.dart';
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
                    icon: const Icon(Icons.save_rounded),
                    onPressed: () {
                      context.read<PlayerBloc>().add(
                        SaveEvent(stemVolumes: state.stemVolumes),
                      );
                    },
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /* Text('CoverPath: ${song.coverPath}'),
                    Text('VocalStemPath: ${song.pathVocals}'),
                    Text('BassStemPath: ${song.pathBass}'),
                    Text('DrumsStemPath: ${song.pathDrums}'),
                    Text('OtherStemPath: ${song.pathOther}'),
                    Text('PianoStemPath: ${song.pathPiano}'),
                    Text('GuitarStemPath: ${song.pathGuitar}'), */
                    _buildPlayBackControls(context, state),
                    _buildStemsControls(context, state),
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

  Widget _buildStemsControls(BuildContext context, PlayerLoaded state) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.defaultBlack.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          _buildStemControl(context, state, StemName.vocals),
          //const Divider(color: Colors.white10, height: 1),
          _buildStemControl(context, state, StemName.drums),
          //const Divider(color: Colors.white10, height: 1),
          _buildStemControl(context, state, StemName.guitar),
          //const Divider(color: Colors.white10, height: 1),
          _buildStemControl(context, state, StemName.bass),
          //const Divider(color: Colors.white10, height: 1),
          _buildStemControl(context, state, StemName.piano),
          //const Divider(color: Colors.white10, height: 1),
          _buildStemControl(context, state, StemName.other),
        ],
      ),
    );
  }

  Widget _buildStemControl(
    BuildContext context,
    PlayerLoaded state,
    StemName StemName,
  ) {
    final volume = state.stemVolumes[StemName]!;
    final percentage = (volume * 100).round();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppTheme.defaultImagePlaceholderBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.volcano,
                  size: 18,
                  color: AppTheme.defaultWhite,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(StemName.name)),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.volume_off,
                    color: AppTheme.defaultWhite,
                    size: 24,
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
                  value: volume,
                  onChanged: (value) => context.read<PlayerBloc>().add(
                    SetVolumeEvent(StemName, value),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 40,
                child: Text("$percentage%", textAlign: TextAlign.end),
              ),
            ],
          ),
        ],
      ),
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
