import 'package:flutter/material.dart';

Future<void> showLoadingAction(
  BuildContext context,
  String message,
  void Function(bool didPop, dynamic result)? onPopWithResult,
) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black54,
    useRootNavigator: true,
    builder: (ctx) => PopScope(
      canPop: false,
      onPopInvokedWithResult: onPopWithResult,
      child: const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Deleting songs...'),
          ],
        ),
      ),
    ),
  );
}
