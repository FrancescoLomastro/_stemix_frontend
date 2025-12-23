import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';
import 'package:stemix_frontend/data/local/drift/stem_names.dart';
import 'package:stemix_frontend/main.dart';

@lazySingleton
class SongRepository {
  final AppDatabase _db;
  String? _assetsSubfolder;

  SongRepository(this._db);

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
    bool isMetronomeEnabled,
    MetronomeSpeed metronomeSpeed,
  ) async {
    final companion = SongsCompanion(
      vocalsVol: drift.Value(stemVolumes[StemName.vocals]!),
      drumsVol: drift.Value(stemVolumes[StemName.drums]!),
      bassVol: drift.Value(stemVolumes[StemName.bass]!),
      otherVol: drift.Value(stemVolumes[StemName.other]!),
      pianoVol: drift.Value(stemVolumes[StemName.piano]!),
      guitarVol: drift.Value(stemVolumes[StemName.guitar]!),
      isMetronomeEnabled: drift.Value(isMetronomeEnabled),
      metronomeSpeed: drift.Value(metronomeSpeed),
    );
    final result = await (_db.update(
      _db.songs,
    )..where((s) => s.id.equals(songId))).write(companion);
    if (result == 0) {
      throw Exception("Failed to update song with id $songId");
    }
  }
}
