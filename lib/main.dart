import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:drift/drift.dart' as drift; // Alias per evitare conflitti
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/data/local/database.dart';
import 'package:stemix_frontend/features/upload/bloc/upload_bloc.dart';
import 'package:stemix_frontend/router/app_router.dart';
import 'package:stemix_frontend/theme/app_theme.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0, // Meno rumore nello stack trace
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  // =================================================================
  // 🛠️ ZONA MANUTENZIONE DATABASE 🛠️
  // Decommenta le funzioni che vuoi eseguire all'avvio dell'app.
  // =================================================================

  // await debugUpdateSong(1);      // <-- Modifica la canzone con ID 1
  // await debugDeleteSong(99);     // <-- Elimina la canzone con ID 99

  /* await debugCreateSong("Canzone di Test", "Artista di Test", 240, [
    0.0,
    1.5,
    3.0,
    4.5,
    6.0,
  ]); */
  await debugLogAllSongs();
  // =================================================================

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadBlocProvider = BlocProvider(create: (_) => getIt<UploadBloc>());

    return MultiBlocProvider(
      providers: [uploadBlocProvider],
      child: MaterialApp.router(
        title: 'SteMix',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        routerConfig: appRouter,
      ),
    );
  }
}

// =================================================================
// 👇 FUNZIONI DI DEBUG PER IL DATABASE (DA COPIARE NEL MAIN) 👇
// =================================================================

/// 🔍 LEGGI: Stampa log formattati di tutte le canzoni
Future<void> debugLogAllSongs() async {
  final db = getIt<AppDatabase>();
  final songs = await db.select(db.songs).get();

  if (songs.isEmpty) {
    logger.w("📭 IL DATABASE È VUOTO.");
  } else {
    logger.i("🎵 ELENCO CANZONI NEL DB (${songs.length}) 🎵");
    for (var song in songs) {
      logger.d("$song");
    }
  }
}

/// ➕ CREA: Inserisce una canzone mock nel DB
Future<void> debugCreateSong(
  String title,
  String artist,
  int duration,
  List<double> musicBeatsPositions,
) async {
  final db = getIt<AppDatabase>();

  // Utilizziamo i Companion per inserire i dati
  final newSong = SongsCompanion.insert(
    title: title,
    artist: artist,
    duration: duration,
    musicBeatsPositions: musicBeatsPositions,
  );

  final id = await db.into(db.songs).insert(newSong);
  logger.t("✅ Canzone creata con successo! ID assegnato: $id");
}

/// ✏️ MODIFICA: Cambia il titolo di una canzone dato il suo ID
Future<void> debugUpdateSong(int id) async {
  final db = getIt<AppDatabase>();

  final result = await (db.update(db.songs)..where((tbl) => tbl.id.equals(id)))
      .write(
        const SongsCompanion(
          title: drift.Value("Titolo Modificato dal Debug"),
          artist: drift.Value("Artista Aggiornato"),
        ),
      );

  if (result > 0) {
    logger.i("✏️ Canzone #$id aggiornata correttamente.");
  } else {
    logger.e("❌ Impossibile aggiornare: Canzone #$id non trovata.");
  }
}

/// 🗑️ ELIMINA: Rimuove una canzone dato il suo ID
Future<void> debugDeleteSong(int id) async {
  final db = getIt<AppDatabase>();

  final result = await (db.delete(
    db.songs,
  )..where((tbl) => tbl.id.equals(id))).go();

  if (result > 0) {
    logger.w("🗑️ Canzone #$id eliminata per sempre.");
  } else {
    logger.e("❌ Impossibile eliminare: Canzone #$id non trovata.");
  }
}
