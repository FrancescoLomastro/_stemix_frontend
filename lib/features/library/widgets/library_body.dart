import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart';
import 'package:stemix_frontend/features/library/widgets/library_list_tile.dart';

class LibraryBody extends StatelessWidget {
  const LibraryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      builder: (context, state) {
        if (state.status == LibraryStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.songs.isNotEmpty) {
          return _buildLibrary(context, state);
        }

        return _buildEmptyLibrary();
      },
    );
  }

  // Build the main library view with song list
  Widget _buildLibrary(BuildContext context, LibraryState state) {
    final allSelected =
        state.selectedSongIds.length == state.songs.length &&
        state.songs.isNotEmpty;

    return Column(
      children: [
        if (state.isSelectionMode) ...[
          _buildSelectAllCheckbox(context, allSelected),
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

  // Build empty library view
  Widget _buildEmptyLibrary() {
    return Center(child: Text("Empty Library"));
  }

  // Build "Select All" checkbox widget
  Widget _buildSelectAllCheckbox(BuildContext context, bool allSelected) {
    return Padding(
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
          Text("Select All", style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
