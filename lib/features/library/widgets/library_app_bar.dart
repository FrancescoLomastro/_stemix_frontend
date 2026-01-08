import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart';
import 'package:stemix_frontend/features/library/widgets/library_delete_confirm.dart';
import 'package:stemix_frontend/features/library/widgets/library_order_dialog.dart';

class LibraryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LibraryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      builder: (context, state) {
        final isSelectionMode = state.isSelectionMode;
        final selectedCount = state.selectedSongIds.length;

        return AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          title: isSelectionMode
              ? Text('$selectedCount selected')
              : const Text('Library'),
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
                onPressed:
                    (selectedCount > 0 &&
                        state.status != LibraryStatus.deleting)
                    ? () => showLibraryDeleteConfirm(context, selectedCount)
                    : null,
                color: Theme.of(context).colorScheme.onSurface,
              ),

            buildPopupMenu(context, state),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget buildPopupMenu(BuildContext context, LibraryState state) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'Select') {
          if (!state.isSelectionMode) {
            context.read<LibraryBloc>().add(ToggleSelectionModeEvent());
          }
        } else if (value == 'Order') {
          showOrderDialog(context, state);
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          if (!state.isSelectionMode)
            const PopupMenuItem<String>(value: 'Select', child: Text('Select')),
          const PopupMenuItem<String>(value: 'Order', child: Text('Order')),
        ];
      },
    );
  }
}
