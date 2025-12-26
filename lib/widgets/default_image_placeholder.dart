import 'package:flutter/material.dart';

class DefaultImagePlaceholder extends StatelessWidget {
  final double size;

  const DefaultImagePlaceholder({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final iconSize = size * 0.4;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Center(child: Icon(Icons.music_note, size: iconSize)),
    );
  }
}
