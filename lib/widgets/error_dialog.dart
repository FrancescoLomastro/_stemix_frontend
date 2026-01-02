import 'package:flutter/material.dart';

// Show an error dialog with the provided message
Future<void> showErrorDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text("Error"),
      content: Text(message),
      actions: [
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
          ),
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text("Ok"),
        ),
      ],
    ),
  );
}
