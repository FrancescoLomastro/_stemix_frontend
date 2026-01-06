import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/data/local/drift/stem_names.dart';
import 'package:stemix_frontend/data/remote/upload_step.dart';
import 'package:stemix_frontend/main.dart';

@lazySingleton
class SongRepository {
  final AppDatabase _db;
  final Dio _dio;
  String? _assetsSubfolder;

  SongRepository(this._db, this._dio);

  Future<String> uploadSong(FormData formData) async {
    final response = await _dio.post('/upload', data: formData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data['job_id'].toString();
    } else {
      throw Exception("Server Error: ${response.statusCode}");
    }
  }

  Future<void> monitorJobProgress({
    required Duration pollInterval,
    required String jobId,
    required void Function(UploadStep step, int progress) onProgress,
  }) async {
    bool isCompleted = false;

    while (!isCompleted) {
      final response = await _dio.get('/status/$jobId');

      if (response.statusCode == 200) {
        final data = response.data;
        final progress = data['progress'] as int;
        final step = UploadStep.fromString(data['status']);

        switch (step) {
          case UploadStep.completed:
            isCompleted = true;
            onProgress(step, progress);
            break;
          case UploadStep.failed:
            throw Exception("Job failed on server.");
          default:
            onProgress(step, progress);
        }
      } else {
        throw Exception("Failed to fetch job status: ${response.statusCode}");
      }

      await Future.delayed(pollInterval);
    }
  }

  Future<void> download(
    String jobId,
    String title,
    String artist, {
    required void Function(int) onProgress,
  }) async {
    String? zipPath;
    try {
      final tempDir = await getTemporaryDirectory();
      zipPath = p.join(tempDir.path, '$jobId.zip');

      await _dio.download(
        '/download/$jobId',
        zipPath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            onProgress.call((received / total * 100).toInt());
          }
        },
      );

      await _unZipAndStore(title, artist, zipPath);
    } catch (e) {
      rethrow;
    } finally {
      if (zipPath != null) {
        final file = File(zipPath);
        if (await file.exists()) {
          await file.delete();
        }
      }
    }
  }

  Future<void> _unZipAndStore(
    String title,
    String artist,
    String zipFilePath,
  ) async {
    final songId = await _db
        .select(_db.songs)
        .get()
        .then((value) => value.isEmpty ? 0 : value.last.id + 1);
    final songDirectory = p.join(await songAssetsPath, songId.toString());
    await Directory(songDirectory).create(recursive: true);

    final inputStream = InputFileStream(zipFilePath);
    final archive = ZipDecoder().decodeStream(inputStream);

    // Estrarre i file dallo zip, escludendo metadata.json
    String? metadataContent;
    final Map<String, String> filePaths = {};

    for (final file in archive) {
      if (file.name == 'metadata.json') {
        metadataContent = utf8.decode(file.content as List<int>);
      } else {
        final outputPath = p.join(songDirectory, file.name);
        final outputFile = File(outputPath);

        if (file.isFile) {
          await outputFile.parent.create(recursive: true);
          await outputFile.writeAsBytes(file.content as List<int>);
          filePaths[file.name] = outputPath;
        }
      }
    }

    final Map<String, dynamic> metadata = jsonDecode(metadataContent!);

    String? coverPath;
    String? vocalsPath;
    String? guitarPath;
    String? drumsPath;
    String? bassPath;
    String? pianoPath;
    String? otherPath;

    // Cercare i file nello zip estratto
    for (final entry in filePaths.entries) {
      final fileName = p.basename(entry.key).toLowerCase();
      if (fileName.startsWith('cover')) {
        coverPath = entry.value;
      } else if (fileName.startsWith('vocals')) {
        vocalsPath = entry.value;
      } else if (fileName.startsWith('guitar')) {
        guitarPath = entry.value;
      } else if (fileName.startsWith('drums')) {
        drumsPath = entry.value;
      } else if (fileName.startsWith('bass')) {
        bassPath = entry.value;
      } else if (fileName.startsWith('piano')) {
        pianoPath = entry.value;
      } else if (fileName.startsWith('other')) {
        otherPath = entry.value;
      }
    }

    final duration =
        ((await MetadataGod.readMetadata(file: vocalsPath!)).durationMs! / 1000)
            .round();

    final newSong = SongsCompanion.insert(
      title: title,
      artist: artist,
      duration: duration,
      coverPath: drift.Value(coverPath),
      vocalsPath: drift.Value(vocalsPath),
      guitarPath: drift.Value(guitarPath),
      drumsPath: drift.Value(drumsPath),
      bassPath: drift.Value(bassPath),
      pianoPath: drift.Value(pianoPath),
      otherPath: drift.Value(otherPath),
      musicBpm: drift.Value(metadata['bpm'].toDouble()),
      musicKey: drift.Value(metadata['key']),
      musicBeatsPositions: metadata['beat_list'].cast<double>(),
    );

    await _db.into(_db.songs).insert(newSong);
  }

  Future<String> get songAssetsPath async {
    if (_assetsSubfolder != null) {
      return _assetsSubfolder!;
    } else {
      final docsPath = (await getApplicationDocumentsDirectory()).path;
      _assetsSubfolder = p.join(docsPath, 'song_assets');
      return _assetsSubfolder!;
    }
  }

  Future<List<Song>> getAllSongs() async {
    return await _db.select(_db.songs).get();
  }

  Future<void> deleteSongs(List<int> ids) async {
    await Future.delayed(const Duration(seconds: 3));

    final songsToDelete = await (_db.select(
      _db.songs,
    )..where((tbl) => tbl.id.isIn(ids))).get();

    for (var song in songsToDelete) {
      await _deleteSongAssets(song.id);
    }

    final deletedCount = await (_db.delete(
      _db.songs,
    )..where((tbl) => tbl.id.isIn(ids))).go();

    if (deletedCount == 0 || deletedCount != ids.length) {
      logger.e(
        "Error deleting songs: requested ${ids.length}, deleted $deletedCount",
      );
      throw Exception(
        "The number of deleted songs is zero or does not match the number of requested deletions.",
      );
    }
  }

  /* Not used */
  Future<void> deleteSong(int id) async {
    final songToDelete = await (_db.select(
      _db.songs,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

    if (songToDelete == null) {
      return;
    }

    await _deleteSongAssets(songToDelete.id);

    final deletedCount = await (_db.delete(
      _db.songs,
    )..where((tbl) => tbl.id.equals(id))).go();

    if (deletedCount == 0) {
      throw Exception("The number of deleted songs is zero.");
    }
  }

  Future<void> _deleteSongAssets(int id) async {
    final thisSongPath = p.join(await songAssetsPath, id.toString());
    final thisSongDir = Directory(thisSongPath);

    if (await thisSongDir.exists()) {
      await thisSongDir.delete(recursive: true);
    }
  }

  Future<void> updateSong(
    int songId,
    Map<StemName, double> stemVolumes,
    MetronomeSpeed metronomeSpeed,
    double metronomeVolume,
  ) async {
    final companion = SongsCompanion(
      vocalsVol: drift.Value(stemVolumes[StemName.vocals]!),
      drumsVol: drift.Value(stemVolumes[StemName.drums]!),
      bassVol: drift.Value(stemVolumes[StemName.bass]!),
      otherVol: drift.Value(stemVolumes[StemName.other]!),
      pianoVol: drift.Value(stemVolumes[StemName.piano]!),
      guitarVol: drift.Value(stemVolumes[StemName.guitar]!),
      metronomeSpeed: drift.Value(metronomeSpeed),
      metronomeVolume: drift.Value(metronomeVolume),
    );
    final result = await (_db.update(
      _db.songs,
    )..where((s) => s.id.equals(songId))).write(companion);
    if (result == 0) {
      throw Exception("Failed to update song with id $songId");
    }
  }
}
