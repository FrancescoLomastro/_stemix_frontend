import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart';
import 'package:stemix_frontend/features/library/widgets/library_delete_confirm.dart';

class LibraryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LibraryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      builder: (context, state) {
        final isSelectionMode = state.isSelectionMode;
        final selectedCount = state.selectedSongIds.length;

        return AppBar(
          title: isSelectionMode
              ? Text('$selectedCount selezionati')
              : const Text('Libreria'),
          leading: isSelectionMode
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => context.read<LibraryBloc>().add(
                    ToggleSelectionModeEvent(),
                  ),
                )
              : null,
          actions: [
            if (isSelectionMode)
              IconButton(
                icon: const Icon(Icons.delete),
                // Disabilita il bottone se stiamo già cancellando o se selezione è vuota
                onPressed:
                    (selectedCount > 0 &&
                        state.status != LibraryStatus.deleting)
                    ? () => showLibraryDeleteConfirm(context, selectedCount)
                    : null,
              ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
