import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/drift/database.dart';

@lazySingleton
class SongRepository {
  final AppDatabase _db;

  SongRepository(this._db);

  Future<List<Song>> getAllSongs() async {
    return await _db.select(_db.songs).get();
  }
}
