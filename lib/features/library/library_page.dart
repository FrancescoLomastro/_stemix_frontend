import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart';
import 'package:stemix_frontend/features/library/widgets/library_list_tile.dart';
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
    return BlocListener<LibraryBloc, LibraryState>(
      listenWhen: (previous, current) =>
          current is LibraryError ||
          (current is LibraryDeleting && current.completed),
      listener: (context, state) {
        //Close the deleting dialog
        switch (state) {
          case LibraryDeleting(:final completed) when completed:
            Navigator.of(context, rootNavigator: true).pop();
          case LibraryError(:final message):
            // Show error snackbar
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
        }
      },
      child: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, state) {
          Widget bodyContent;
          switch (state) {
            case LibraryDeleting():
            case LibraryLoading():
              bodyContent = _buildLibraryLoading();
            case LibraryError(:final message):
              bodyContent = _buildLibraryError(message);
            case LibraryLoaded():
              bodyContent = _buildLibraryLoaded(context, state);
            default:
              logger.e("LibraryPage - Unknown state: $state");
              bodyContent = const Center(child: Text("Unknown state"));
          }
          return Scaffold(
            appBar: _buildAppBar(context, state),
            body: bodyContent,
          );
        },
      ),
    );
  }

  Widget _buildLibraryLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLibraryError(String message) {
    return Center(child: Text(message));
  }

  Widget _buildLibraryLoaded(BuildContext context, LibraryLoaded state) {
    final allSelected =
        state.selectedSongIds.length == state.songs.length &&
        state.songs.isNotEmpty;

    return Column(
      children: [
        if (state.isSelectionMode) ...[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Checkbox(
                  value: allSelected,
                  onChanged: (isSelect) {
                    context.read<LibraryBloc>().add(
                      SelectAllEvent(isSelect ?? false),
                    );
                  },
                ),
                Text(
                  "Select All",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
        Expanded(
          child: ListView.builder(
            itemCount: state.songs.length,
            itemBuilder: (context, index) {
              final song = state.songs[index];
              final isSelected = state.selectedSongIds.contains(song.id);
              return SongListTile(
                song: song,
                isSelectionMode: state.isSelectionMode,
                isSelected: isSelected,
              );
            },
          ),
        ),
      ],
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context, LibraryState state) {
  final bool isSelectionMode = state is LibraryLoaded && state.isSelectionMode;
  final int selectedCount = state is LibraryLoaded
      ? state.selectedSongIds.length
      : 0;

  return AppBar(
    title: isSelectionMode
        ? Text('$selectedCount selected')
        : const Text('Library'),
    leading: isSelectionMode
        ? IconButton(
            icon: const Icon(Icons.close),
            onPressed: () =>
                context.read<LibraryBloc>().add(ToggleSelectionModeEvent()),
          )
        : null,
    actions: [
      if (isSelectionMode) ...[
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: selectedCount > 0
              ? () => _showDeleteDialog(context, state)
              : null,
        ),
      ] else if (state is LibraryLoaded)
        ...[
      ]
    ],
  );
}

void _showDeleteDialog(BuildContext context, LibraryState state) {
  final int count = state is LibraryLoaded ? state.selectedSongIds.length : 0;

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (ctx) => AlertDialog(
      title: const Text("Delete songs"),
      content: Text(
        "Are you sure you want to delete $count songs from the device?",
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
            context.read<LibraryBloc>().add(DeleteSelectedSongsEvent());
            _showDeletingDialog(context);
          },
          child: const Text("Delete"),
        ),
      ],
    ),
  );
}

void _showDeletingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => AlertDialog(
      title: const Text("Deleting songs"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 8),
          Text("Deleting..."),
        ],
      ),
    ),
  );
}
