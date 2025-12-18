import 'package:flutter/material.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Player Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Player Functionality Coming Soon!'),
            const Text('Enjoy your music!'),
            TextButton(onPressed: () {}, child: const Text('Play')),
          ],
        ),
      ),
    );
  }
}
