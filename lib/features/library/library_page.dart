import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart';
import 'package:stemix_frontend/features/library/widgets/list_tile.dart';
import 'package:stemix_frontend/main.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LibraryBloc>()..add(LoadSongsEvent()),
      child: const _LibraryView(),
    );
  }
}

class _LibraryView extends StatelessWidget {
  const _LibraryView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      builder: (context, state) {
        Widget bodyContent;
        switch (state) {
          case LibraryLoading():
            bodyContent = _buildLibraryLoading();
          case LibraryError(:final message):
            bodyContent = _buildLibraryError(message);
          case LibraryLoaded(:final songs):
            bodyContent = _buildLibraryLoaded(songs);
          default:
            logger.e("LibraryPage - Unknown state: $state");
            bodyContent = const Center(child: Text("Unknown state"));
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Library')),
          body: bodyContent,
        );
      },
    );
  }

  Widget _buildLibraryLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLibraryError(String message) {
    return Center(child: Text(message));
  }

  Widget _buildLibraryLoaded(List<Song> songs) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return SongListTile(song: song);
      },
    );
  }
}
