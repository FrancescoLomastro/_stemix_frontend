import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart';

// Show a confirmation dialog before deleting selected songs
Future<void> showLibraryDeleteConfirm(BuildContext context, int count) async {
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
          child: Text(
            "Cancel",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(ctx);
            context.read<LibraryBloc>().add(DeleteSelectedSongsEvent());
          },
          style: FilledButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
          child: Text("Delete"),
        ),
      ],
    ),
  );
}
