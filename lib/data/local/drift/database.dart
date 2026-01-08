import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:stemix_frontend/data/local/drift/list_converter.dart';
import 'package:stemix_frontend/data/local/drift/metronome_speed_converter.dart';

part 'database.g.dart';

/// Defines the Songs table in the local database
class Songs extends Table {
  // Auto-incremented ID
  IntColumn get id => integer().autoIncrement()();
  // Song Title
  TextColumn get title => text()();
  // Song Artist
  TextColumn get artist => text()();
  // Song Duration in seconds
  IntColumn get duration => integer()();
  // Date and Time when the song was added
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  // Local path to the cover image
  TextColumn get coverPath => text().nullable()();
  // BPM of the song
  RealColumn get musicBpm => real().nullable()();
  // Musical Key of the song
  TextColumn get musicKey => text().nullable()();
  // Positions of the beats in the song, stored as a JSON-encoded list
  TextColumn get musicBeatsPositions => text().map(const ListConverter())();

  // Paths to the stems
  TextColumn get vocalsPath => text().nullable()();
  TextColumn get guitarPath => text().nullable()();
  TextColumn get drumsPath => text().nullable()();
  TextColumn get bassPath => text().nullable()();
  TextColumn get pianoPath => text().nullable()();
  TextColumn get otherPath => text().nullable()();

  // Volume levels for each stem, defaulting to 1.0
  RealColumn get volMetronome => real().withDefault(const Constant(1.0))();
  RealColumn get vocalsVol => real().withDefault(const Constant(1.0))();
  RealColumn get guitarVol => real().withDefault(const Constant(1.0))();
  RealColumn get drumsVol => real().withDefault(const Constant(1.0))();
  RealColumn get bassVol => real().withDefault(const Constant(1.0))();
  RealColumn get pianoVol => real().withDefault(const Constant(1.0))();
  RealColumn get otherVol => real().withDefault(const Constant(1.0))();

  TextColumn get metronomeSpeed => text()
      .map(const MetronomeSpeedConverter())
      .withDefault(Constant(MetronomeSpeed.normal.name))();
  RealColumn get metronomeVolume => real().withDefault(const Constant(1.0))();
}

/// This is the main database class which manages the connection and provides
/// access to the tables.
@LazySingleton()
@DriftDatabase(tables: [Songs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

/// Opens the connection to the local SQLite database file
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'stemix.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
