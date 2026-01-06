import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:drift/drift.dart' as drift; // Alias per evitare conflitti
import 'package:metadata_god/metadata_god.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:stemix_frontend/features/upload/bloc/upload_bloc.dart';
import 'package:stemix_frontend/router/app_router.dart';
import 'package:stemix_frontend/theme/theme.dart';
import 'package:stemix_frontend/theme/util.dart';

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
  await MetadataGod.initialize();
  await configureDependencies();

  // =================================================================
  // 🛠️ ZONA MANUTENZIONE DATABASE 🛠️
  // Decommenta le funzioni che vuoi eseguire all'avvio dell'app.
  // =================================================================

  // await debugUpdateSong(1);      // <-- Modifica la canzone con ID 1
  // await debugDeleteSong(99);     // <-- Elimina la canzone con ID 99

  /* await debugDeleteAllSongs(); */

  for (int i = 0; i < 5; i++) {
    await debugCreateSong(
      title: "Canzone di Test #$i",
      artist: "Artista di Test",
      hasImage: i % 2 == 0,
      hasAudio: true,
    );
  }
  /* await debugLogAllSongs(); */
  // =================================================================

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadBlocProvider = BlocProvider(create: (_) => getIt<UploadBloc>());

    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiBlocProvider(
      providers: [uploadBlocProvider],
      child: MaterialApp.router(
        title: 'SteMix',
        theme: /*brightness == Brightness.light ? theme.light() : */ theme
            .dark(),
        routerConfig: appRouter,
      ),
    );
  }
}

// =================================================================
// 👇 FUNZIONI DI DEBUG PER IL DATABASE (DA COPIARE NEL MAIN) 👇
// =================================================================

Future<void> debugDeleteAllSongs() async {
  final db = getIt<AppDatabase>();

  //get all songs
  final songs = await db.select(db.songs).get();

  for (var song in songs) {
    await debugDeleteSong(song.id);
  }
}

/// 🔍 LEGGI: Stampa log formattati di tutte le canzoni
Future<void> debugLogAllSongs() async {
  final db = getIt<AppDatabase>();
  final songs = await db.select(db.songs).get();

  if (songs.isEmpty) {
    logger.w("📭 IL DATABASE È VUOTO.");
  } else {
    for (var song in songs) {
      String out = "";
      for (var field in song.toColumns(true).entries) {
        out += " - ${field.key}: ${field.value}\n";
      }
      logger.i(out);
    }
  }
}

/// ➕ CREA: Inserisce una canzone mock nel DB
Future<void> debugCreateSong({
  required String title,
  required String artist,
  bool hasImage = false,
  bool hasAudio = false,
}) async {
  var duration = 180; // durata di default in secondi
  final db = getIt<AppDatabase>();

  String? coverPath;
  String? vocalPath;
  String? pianoPath;
  String? drumsPath;
  String? bassPath;
  String? otherPath;
  String? guitarPath;

  final songId = await db
      .select(db.songs)
      .get()
      .then((value) => value.length + 1);
  final documentFolder = (await getApplicationDocumentsDirectory()).path;
  final songFolder = "song_assets/$songId";

  final fullSongFolderPath = p.join(documentFolder, songFolder);
  await Directory(fullSongFolderPath).create(recursive: true);

  if (hasImage) {
    try {
      final random1o2 = (DateTime.now().millisecondsSinceEpoch % 2) + 1;
      String assetPath = "assets/images/sample_image${random1o2}.jpg";

      final coverFilePath = p.join(fullSongFolderPath, "cover.png");
      final byteData = await rootBundle.load(assetPath);
      final file = File(coverFilePath);
      await file.writeAsBytes(byteData.buffer.asUint8List());
      coverPath = coverFilePath;
      logger.d("🖼️ Immagine salvata in: $coverPath");
    } catch (e) {
      logger.e("❌ Errore nel salvare l'immagine: $e");
    }
  }
  if (hasAudio) {
    String vocalAssetPath = "assets/audio/vocals.ogg";
    String pianoAssetPath = "assets/audio/piano.ogg";
    String drumsAssetPath = "assets/audio/drums.ogg";
    String bassAssetPath = "assets/audio/bass.ogg";
    String otherAssetPath = "assets/audio/other.ogg";
    String guitarAssetPath = "assets/audio/guitar.ogg";
    vocalPath = p.join(fullSongFolderPath, "vocals.ogg");
    pianoPath = p.join(fullSongFolderPath, "piano.ogg");
    drumsPath = p.join(fullSongFolderPath, "drums.ogg");
    bassPath = p.join(fullSongFolderPath, "bass.ogg");
    otherPath = p.join(fullSongFolderPath, "other.ogg");
    guitarPath = p.join(fullSongFolderPath, "guitar.ogg");

    // Copy the files to the song folder
    final vocalFile = File(vocalPath);
    final pianoFile = File(pianoPath);
    final drumsFile = File(drumsPath);
    final bassFile = File(bassPath);
    final otherFile = File(otherPath);
    final guitarFile = File(guitarPath);

    await vocalFile.writeAsBytes(
      (await rootBundle.load(vocalAssetPath)).buffer.asUint8List(),
    );
    await pianoFile.writeAsBytes(
      (await rootBundle.load(pianoAssetPath)).buffer.asUint8List(),
    );
    await drumsFile.writeAsBytes(
      (await rootBundle.load(drumsAssetPath)).buffer.asUint8List(),
    );
    await bassFile.writeAsBytes(
      (await rootBundle.load(bassAssetPath)).buffer.asUint8List(),
    );
    await otherFile.writeAsBytes(
      (await rootBundle.load(otherAssetPath)).buffer.asUint8List(),
    );
    await guitarFile.writeAsBytes(
      (await rootBundle.load(guitarAssetPath)).buffer.asUint8List(),
    );

    duration =
        ((await MetadataGod.readMetadata(file: vocalPath)).durationMs! / 1000)
            .round();
  }

  final musicBeatsPositions = [for (double i = 0; i < 600; i++) i * 500];

  // Utilizziamo i Companion per inserire i dati
  final newSong = SongsCompanion.insert(
    title: title,
    artist: artist,
    duration: duration,
    musicBeatsPositions: musicBeatsPositions,
    coverPath: coverPath != null
        ? drift.Value(coverPath)
        : const drift.Value.absent(),
    vocalsPath: vocalPath != null
        ? drift.Value(vocalPath)
        : const drift.Value.absent(),
    pianoPath: pianoPath != null
        ? drift.Value(pianoPath)
        : const drift.Value.absent(),
    drumsPath: drumsPath != null
        ? drift.Value(drumsPath)
        : const drift.Value.absent(),
    bassPath: bassPath != null
        ? drift.Value(bassPath)
        : const drift.Value.absent(),
    otherPath: otherPath != null
        ? drift.Value(otherPath)
        : const drift.Value.absent(),
    guitarPath: guitarPath != null
        ? drift.Value(guitarPath)
        : const drift.Value.absent(),
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

  // before deleting the song, we want to delete associated files.
  // Fetch the song first, then get the coverPath and delete the file and the parent folder.
  final songToDelete = await (db.select(
    db.songs,
  )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  if (songToDelete != null && songToDelete.coverPath != null) {
    final coverFile = File(songToDelete.coverPath!);
    if (await coverFile.exists()) {
      final parentDir = coverFile.parent;
      await parentDir.delete(recursive: true);
    }
  }

  final result = await (db.delete(
    db.songs,
  )..where((tbl) => tbl.id.equals(id))).go();

  if (result > 0) {
    logger.i("🗑️ Canzone #$id eliminata correttamente.");
  } else {
    logger.e("❌ Impossibile eliminare: Canzone #$id non trovata.");
  }
}
