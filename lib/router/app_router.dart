import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stemix_frontend/features/library/library_page.dart';
import 'package:stemix_frontend/features/player/player_page.dart';
import 'package:stemix_frontend/features/playlists/playlists_page.dart';
import 'package:stemix_frontend/features/upload/upload_page.dart';

/// The navigator key for the root navigator.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root-navigator',
);

/// The navigator key for the navigator inside a shell.
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell-navigator',
);

/// The shell route that contains the main sections of the app.
final ShellRoute shellRoute = ShellRoute(
  navigatorKey: shellNavigatorKey,
  builder: (context, state, child) {
    return Scaffold(body: child);
  },
  routes: [
    GoRoute(
      path: '/library',
      pageBuilder: (context, state) =>
          NoTransitionPage(child: const LibraryPage()),
    ),
    GoRoute(
      path: '/upload',
      pageBuilder: (context, state) =>
          NoTransitionPage(child: const UploadPage()),
    ),
    GoRoute(
      path: '/playlists',
      pageBuilder: (context, state) =>
          NoTransitionPage(child: const PlaylistsPage()),
    ),
  ],
);

/// The route for the player page. (is outside the shell)
final GoRoute playerRoute = GoRoute(
  path: '/player',
  parentNavigatorKey: rootNavigatorKey,
  builder: (context, state) {
    //final song = state.extra as Song;
    return PlayerPage(/*song: song*/);
  },
);

/// The main app router. Library is the initial location.
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/library',
  routes: [shellRoute, playerRoute],
);
