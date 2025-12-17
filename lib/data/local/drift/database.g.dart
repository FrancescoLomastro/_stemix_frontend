// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SongsTable extends Songs with TableInfo<$SongsTable, Song> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
    'artist',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _coverPathMeta = const VerificationMeta(
    'coverPath',
  );
  @override
  late final GeneratedColumn<String> coverPath = GeneratedColumn<String>(
    'cover_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _musicBpmMeta = const VerificationMeta(
    'musicBpm',
  );
  @override
  late final GeneratedColumn<double> musicBpm = GeneratedColumn<double>(
    'music_bpm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _musicKeyMeta = const VerificationMeta(
    'musicKey',
  );
  @override
  late final GeneratedColumn<String> musicKey = GeneratedColumn<String>(
    'music_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<double>, String>
  musicBeatsPositions = GeneratedColumn<String>(
    'music_beats_positions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<List<double>>($SongsTable.$convertermusicBeatsPositions);
  static const VerificationMeta _pathVocalsMeta = const VerificationMeta(
    'pathVocals',
  );
  @override
  late final GeneratedColumn<String> pathVocals = GeneratedColumn<String>(
    'path_vocals',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pathGuitarMeta = const VerificationMeta(
    'pathGuitar',
  );
  @override
  late final GeneratedColumn<String> pathGuitar = GeneratedColumn<String>(
    'path_guitar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pathDrumsMeta = const VerificationMeta(
    'pathDrums',
  );
  @override
  late final GeneratedColumn<String> pathDrums = GeneratedColumn<String>(
    'path_drums',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pathBassMeta = const VerificationMeta(
    'pathBass',
  );
  @override
  late final GeneratedColumn<String> pathBass = GeneratedColumn<String>(
    'path_bass',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pathPianoMeta = const VerificationMeta(
    'pathPiano',
  );
  @override
  late final GeneratedColumn<String> pathPiano = GeneratedColumn<String>(
    'path_piano',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pathOtherMeta = const VerificationMeta(
    'pathOther',
  );
  @override
  late final GeneratedColumn<String> pathOther = GeneratedColumn<String>(
    'path_other',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _volMetronomeMeta = const VerificationMeta(
    'volMetronome',
  );
  @override
  late final GeneratedColumn<double> volMetronome = GeneratedColumn<double>(
    'vol_metronome',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _volVocalsMeta = const VerificationMeta(
    'volVocals',
  );
  @override
  late final GeneratedColumn<double> volVocals = GeneratedColumn<double>(
    'vol_vocals',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _volGuitarMeta = const VerificationMeta(
    'volGuitar',
  );
  @override
  late final GeneratedColumn<double> volGuitar = GeneratedColumn<double>(
    'vol_guitar',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _volDrumsMeta = const VerificationMeta(
    'volDrums',
  );
  @override
  late final GeneratedColumn<double> volDrums = GeneratedColumn<double>(
    'vol_drums',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _volBassMeta = const VerificationMeta(
    'volBass',
  );
  @override
  late final GeneratedColumn<double> volBass = GeneratedColumn<double>(
    'vol_bass',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _volPianoMeta = const VerificationMeta(
    'volPiano',
  );
  @override
  late final GeneratedColumn<double> volPiano = GeneratedColumn<double>(
    'vol_piano',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _volOtherMeta = const VerificationMeta(
    'volOther',
  );
  @override
  late final GeneratedColumn<double> volOther = GeneratedColumn<double>(
    'vol_other',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    artist,
    duration,
    createdAt,
    coverPath,
    musicBpm,
    musicKey,
    musicBeatsPositions,
    pathVocals,
    pathGuitar,
    pathDrums,
    pathBass,
    pathPiano,
    pathOther,
    volMetronome,
    volVocals,
    volGuitar,
    volDrums,
    volBass,
    volPiano,
    volOther,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'songs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Song> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(
        _artistMeta,
        artist.isAcceptableOrUnknown(data['artist']!, _artistMeta),
      );
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('cover_path')) {
      context.handle(
        _coverPathMeta,
        coverPath.isAcceptableOrUnknown(data['cover_path']!, _coverPathMeta),
      );
    }
    if (data.containsKey('music_bpm')) {
      context.handle(
        _musicBpmMeta,
        musicBpm.isAcceptableOrUnknown(data['music_bpm']!, _musicBpmMeta),
      );
    }
    if (data.containsKey('music_key')) {
      context.handle(
        _musicKeyMeta,
        musicKey.isAcceptableOrUnknown(data['music_key']!, _musicKeyMeta),
      );
    }
    if (data.containsKey('path_vocals')) {
      context.handle(
        _pathVocalsMeta,
        pathVocals.isAcceptableOrUnknown(data['path_vocals']!, _pathVocalsMeta),
      );
    }
    if (data.containsKey('path_guitar')) {
      context.handle(
        _pathGuitarMeta,
        pathGuitar.isAcceptableOrUnknown(data['path_guitar']!, _pathGuitarMeta),
      );
    }
    if (data.containsKey('path_drums')) {
      context.handle(
        _pathDrumsMeta,
        pathDrums.isAcceptableOrUnknown(data['path_drums']!, _pathDrumsMeta),
      );
    }
    if (data.containsKey('path_bass')) {
      context.handle(
        _pathBassMeta,
        pathBass.isAcceptableOrUnknown(data['path_bass']!, _pathBassMeta),
      );
    }
    if (data.containsKey('path_piano')) {
      context.handle(
        _pathPianoMeta,
        pathPiano.isAcceptableOrUnknown(data['path_piano']!, _pathPianoMeta),
      );
    }
    if (data.containsKey('path_other')) {
      context.handle(
        _pathOtherMeta,
        pathOther.isAcceptableOrUnknown(data['path_other']!, _pathOtherMeta),
      );
    }
    if (data.containsKey('vol_metronome')) {
      context.handle(
        _volMetronomeMeta,
        volMetronome.isAcceptableOrUnknown(
          data['vol_metronome']!,
          _volMetronomeMeta,
        ),
      );
    }
    if (data.containsKey('vol_vocals')) {
      context.handle(
        _volVocalsMeta,
        volVocals.isAcceptableOrUnknown(data['vol_vocals']!, _volVocalsMeta),
      );
    }
    if (data.containsKey('vol_guitar')) {
      context.handle(
        _volGuitarMeta,
        volGuitar.isAcceptableOrUnknown(data['vol_guitar']!, _volGuitarMeta),
      );
    }
    if (data.containsKey('vol_drums')) {
      context.handle(
        _volDrumsMeta,
        volDrums.isAcceptableOrUnknown(data['vol_drums']!, _volDrumsMeta),
      );
    }
    if (data.containsKey('vol_bass')) {
      context.handle(
        _volBassMeta,
        volBass.isAcceptableOrUnknown(data['vol_bass']!, _volBassMeta),
      );
    }
    if (data.containsKey('vol_piano')) {
      context.handle(
        _volPianoMeta,
        volPiano.isAcceptableOrUnknown(data['vol_piano']!, _volPianoMeta),
      );
    }
    if (data.containsKey('vol_other')) {
      context.handle(
        _volOtherMeta,
        volOther.isAcceptableOrUnknown(data['vol_other']!, _volOtherMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Song map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Song(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      artist: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artist'],
      )!,
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      coverPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_path'],
      ),
      musicBpm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}music_bpm'],
      ),
      musicKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}music_key'],
      ),
      musicBeatsPositions: $SongsTable.$convertermusicBeatsPositions.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}music_beats_positions'],
        )!,
      ),
      pathVocals: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path_vocals'],
      ),
      pathGuitar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path_guitar'],
      ),
      pathDrums: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path_drums'],
      ),
      pathBass: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path_bass'],
      ),
      pathPiano: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path_piano'],
      ),
      pathOther: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path_other'],
      ),
      volMetronome: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vol_metronome'],
      )!,
      volVocals: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vol_vocals'],
      )!,
      volGuitar: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vol_guitar'],
      )!,
      volDrums: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vol_drums'],
      )!,
      volBass: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vol_bass'],
      )!,
      volPiano: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vol_piano'],
      )!,
      volOther: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vol_other'],
      )!,
    );
  }

  @override
  $SongsTable createAlias(String alias) {
    return $SongsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<double>, String> $convertermusicBeatsPositions =
      const ListConverter();
}

class Song extends DataClass implements Insertable<Song> {
  final int id;
  final String title;
  final String artist;
  final int duration;
  final DateTime createdAt;
  final String? coverPath;
  final double? musicBpm;
  final String? musicKey;
  final List<double> musicBeatsPositions;
  final String? pathVocals;
  final String? pathGuitar;
  final String? pathDrums;
  final String? pathBass;
  final String? pathPiano;
  final String? pathOther;
  final double volMetronome;
  final double volVocals;
  final double volGuitar;
  final double volDrums;
  final double volBass;
  final double volPiano;
  final double volOther;
  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.createdAt,
    this.coverPath,
    this.musicBpm,
    this.musicKey,
    required this.musicBeatsPositions,
    this.pathVocals,
    this.pathGuitar,
    this.pathDrums,
    this.pathBass,
    this.pathPiano,
    this.pathOther,
    required this.volMetronome,
    required this.volVocals,
    required this.volGuitar,
    required this.volDrums,
    required this.volBass,
    required this.volPiano,
    required this.volOther,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['artist'] = Variable<String>(artist);
    map['duration'] = Variable<int>(duration);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || coverPath != null) {
      map['cover_path'] = Variable<String>(coverPath);
    }
    if (!nullToAbsent || musicBpm != null) {
      map['music_bpm'] = Variable<double>(musicBpm);
    }
    if (!nullToAbsent || musicKey != null) {
      map['music_key'] = Variable<String>(musicKey);
    }
    {
      map['music_beats_positions'] = Variable<String>(
        $SongsTable.$convertermusicBeatsPositions.toSql(musicBeatsPositions),
      );
    }
    if (!nullToAbsent || pathVocals != null) {
      map['path_vocals'] = Variable<String>(pathVocals);
    }
    if (!nullToAbsent || pathGuitar != null) {
      map['path_guitar'] = Variable<String>(pathGuitar);
    }
    if (!nullToAbsent || pathDrums != null) {
      map['path_drums'] = Variable<String>(pathDrums);
    }
    if (!nullToAbsent || pathBass != null) {
      map['path_bass'] = Variable<String>(pathBass);
    }
    if (!nullToAbsent || pathPiano != null) {
      map['path_piano'] = Variable<String>(pathPiano);
    }
    if (!nullToAbsent || pathOther != null) {
      map['path_other'] = Variable<String>(pathOther);
    }
    map['vol_metronome'] = Variable<double>(volMetronome);
    map['vol_vocals'] = Variable<double>(volVocals);
    map['vol_guitar'] = Variable<double>(volGuitar);
    map['vol_drums'] = Variable<double>(volDrums);
    map['vol_bass'] = Variable<double>(volBass);
    map['vol_piano'] = Variable<double>(volPiano);
    map['vol_other'] = Variable<double>(volOther);
    return map;
  }

  SongsCompanion toCompanion(bool nullToAbsent) {
    return SongsCompanion(
      id: Value(id),
      title: Value(title),
      artist: Value(artist),
      duration: Value(duration),
      createdAt: Value(createdAt),
      coverPath: coverPath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPath),
      musicBpm: musicBpm == null && nullToAbsent
          ? const Value.absent()
          : Value(musicBpm),
      musicKey: musicKey == null && nullToAbsent
          ? const Value.absent()
          : Value(musicKey),
      musicBeatsPositions: Value(musicBeatsPositions),
      pathVocals: pathVocals == null && nullToAbsent
          ? const Value.absent()
          : Value(pathVocals),
      pathGuitar: pathGuitar == null && nullToAbsent
          ? const Value.absent()
          : Value(pathGuitar),
      pathDrums: pathDrums == null && nullToAbsent
          ? const Value.absent()
          : Value(pathDrums),
      pathBass: pathBass == null && nullToAbsent
          ? const Value.absent()
          : Value(pathBass),
      pathPiano: pathPiano == null && nullToAbsent
          ? const Value.absent()
          : Value(pathPiano),
      pathOther: pathOther == null && nullToAbsent
          ? const Value.absent()
          : Value(pathOther),
      volMetronome: Value(volMetronome),
      volVocals: Value(volVocals),
      volGuitar: Value(volGuitar),
      volDrums: Value(volDrums),
      volBass: Value(volBass),
      volPiano: Value(volPiano),
      volOther: Value(volOther),
    );
  }

  factory Song.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Song(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String>(json['artist']),
      duration: serializer.fromJson<int>(json['duration']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      coverPath: serializer.fromJson<String?>(json['coverPath']),
      musicBpm: serializer.fromJson<double?>(json['musicBpm']),
      musicKey: serializer.fromJson<String?>(json['musicKey']),
      musicBeatsPositions: serializer.fromJson<List<double>>(
        json['musicBeatsPositions'],
      ),
      pathVocals: serializer.fromJson<String?>(json['pathVocals']),
      pathGuitar: serializer.fromJson<String?>(json['pathGuitar']),
      pathDrums: serializer.fromJson<String?>(json['pathDrums']),
      pathBass: serializer.fromJson<String?>(json['pathBass']),
      pathPiano: serializer.fromJson<String?>(json['pathPiano']),
      pathOther: serializer.fromJson<String?>(json['pathOther']),
      volMetronome: serializer.fromJson<double>(json['volMetronome']),
      volVocals: serializer.fromJson<double>(json['volVocals']),
      volGuitar: serializer.fromJson<double>(json['volGuitar']),
      volDrums: serializer.fromJson<double>(json['volDrums']),
      volBass: serializer.fromJson<double>(json['volBass']),
      volPiano: serializer.fromJson<double>(json['volPiano']),
      volOther: serializer.fromJson<double>(json['volOther']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String>(artist),
      'duration': serializer.toJson<int>(duration),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'coverPath': serializer.toJson<String?>(coverPath),
      'musicBpm': serializer.toJson<double?>(musicBpm),
      'musicKey': serializer.toJson<String?>(musicKey),
      'musicBeatsPositions': serializer.toJson<List<double>>(
        musicBeatsPositions,
      ),
      'pathVocals': serializer.toJson<String?>(pathVocals),
      'pathGuitar': serializer.toJson<String?>(pathGuitar),
      'pathDrums': serializer.toJson<String?>(pathDrums),
      'pathBass': serializer.toJson<String?>(pathBass),
      'pathPiano': serializer.toJson<String?>(pathPiano),
      'pathOther': serializer.toJson<String?>(pathOther),
      'volMetronome': serializer.toJson<double>(volMetronome),
      'volVocals': serializer.toJson<double>(volVocals),
      'volGuitar': serializer.toJson<double>(volGuitar),
      'volDrums': serializer.toJson<double>(volDrums),
      'volBass': serializer.toJson<double>(volBass),
      'volPiano': serializer.toJson<double>(volPiano),
      'volOther': serializer.toJson<double>(volOther),
    };
  }

  Song copyWith({
    int? id,
    String? title,
    String? artist,
    int? duration,
    DateTime? createdAt,
    Value<String?> coverPath = const Value.absent(),
    Value<double?> musicBpm = const Value.absent(),
    Value<String?> musicKey = const Value.absent(),
    List<double>? musicBeatsPositions,
    Value<String?> pathVocals = const Value.absent(),
    Value<String?> pathGuitar = const Value.absent(),
    Value<String?> pathDrums = const Value.absent(),
    Value<String?> pathBass = const Value.absent(),
    Value<String?> pathPiano = const Value.absent(),
    Value<String?> pathOther = const Value.absent(),
    double? volMetronome,
    double? volVocals,
    double? volGuitar,
    double? volDrums,
    double? volBass,
    double? volPiano,
    double? volOther,
  }) => Song(
    id: id ?? this.id,
    title: title ?? this.title,
    artist: artist ?? this.artist,
    duration: duration ?? this.duration,
    createdAt: createdAt ?? this.createdAt,
    coverPath: coverPath.present ? coverPath.value : this.coverPath,
    musicBpm: musicBpm.present ? musicBpm.value : this.musicBpm,
    musicKey: musicKey.present ? musicKey.value : this.musicKey,
    musicBeatsPositions: musicBeatsPositions ?? this.musicBeatsPositions,
    pathVocals: pathVocals.present ? pathVocals.value : this.pathVocals,
    pathGuitar: pathGuitar.present ? pathGuitar.value : this.pathGuitar,
    pathDrums: pathDrums.present ? pathDrums.value : this.pathDrums,
    pathBass: pathBass.present ? pathBass.value : this.pathBass,
    pathPiano: pathPiano.present ? pathPiano.value : this.pathPiano,
    pathOther: pathOther.present ? pathOther.value : this.pathOther,
    volMetronome: volMetronome ?? this.volMetronome,
    volVocals: volVocals ?? this.volVocals,
    volGuitar: volGuitar ?? this.volGuitar,
    volDrums: volDrums ?? this.volDrums,
    volBass: volBass ?? this.volBass,
    volPiano: volPiano ?? this.volPiano,
    volOther: volOther ?? this.volOther,
  );
  Song copyWithCompanion(SongsCompanion data) {
    return Song(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      artist: data.artist.present ? data.artist.value : this.artist,
      duration: data.duration.present ? data.duration.value : this.duration,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      coverPath: data.coverPath.present ? data.coverPath.value : this.coverPath,
      musicBpm: data.musicBpm.present ? data.musicBpm.value : this.musicBpm,
      musicKey: data.musicKey.present ? data.musicKey.value : this.musicKey,
      musicBeatsPositions: data.musicBeatsPositions.present
          ? data.musicBeatsPositions.value
          : this.musicBeatsPositions,
      pathVocals: data.pathVocals.present
          ? data.pathVocals.value
          : this.pathVocals,
      pathGuitar: data.pathGuitar.present
          ? data.pathGuitar.value
          : this.pathGuitar,
      pathDrums: data.pathDrums.present ? data.pathDrums.value : this.pathDrums,
      pathBass: data.pathBass.present ? data.pathBass.value : this.pathBass,
      pathPiano: data.pathPiano.present ? data.pathPiano.value : this.pathPiano,
      pathOther: data.pathOther.present ? data.pathOther.value : this.pathOther,
      volMetronome: data.volMetronome.present
          ? data.volMetronome.value
          : this.volMetronome,
      volVocals: data.volVocals.present ? data.volVocals.value : this.volVocals,
      volGuitar: data.volGuitar.present ? data.volGuitar.value : this.volGuitar,
      volDrums: data.volDrums.present ? data.volDrums.value : this.volDrums,
      volBass: data.volBass.present ? data.volBass.value : this.volBass,
      volPiano: data.volPiano.present ? data.volPiano.value : this.volPiano,
      volOther: data.volOther.present ? data.volOther.value : this.volOther,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Song(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('duration: $duration, ')
          ..write('createdAt: $createdAt, ')
          ..write('coverPath: $coverPath, ')
          ..write('musicBpm: $musicBpm, ')
          ..write('musicKey: $musicKey, ')
          ..write('musicBeatsPositions: $musicBeatsPositions, ')
          ..write('pathVocals: $pathVocals, ')
          ..write('pathGuitar: $pathGuitar, ')
          ..write('pathDrums: $pathDrums, ')
          ..write('pathBass: $pathBass, ')
          ..write('pathPiano: $pathPiano, ')
          ..write('pathOther: $pathOther, ')
          ..write('volMetronome: $volMetronome, ')
          ..write('volVocals: $volVocals, ')
          ..write('volGuitar: $volGuitar, ')
          ..write('volDrums: $volDrums, ')
          ..write('volBass: $volBass, ')
          ..write('volPiano: $volPiano, ')
          ..write('volOther: $volOther')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    title,
    artist,
    duration,
    createdAt,
    coverPath,
    musicBpm,
    musicKey,
    musicBeatsPositions,
    pathVocals,
    pathGuitar,
    pathDrums,
    pathBass,
    pathPiano,
    pathOther,
    volMetronome,
    volVocals,
    volGuitar,
    volDrums,
    volBass,
    volPiano,
    volOther,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Song &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.duration == this.duration &&
          other.createdAt == this.createdAt &&
          other.coverPath == this.coverPath &&
          other.musicBpm == this.musicBpm &&
          other.musicKey == this.musicKey &&
          other.musicBeatsPositions == this.musicBeatsPositions &&
          other.pathVocals == this.pathVocals &&
          other.pathGuitar == this.pathGuitar &&
          other.pathDrums == this.pathDrums &&
          other.pathBass == this.pathBass &&
          other.pathPiano == this.pathPiano &&
          other.pathOther == this.pathOther &&
          other.volMetronome == this.volMetronome &&
          other.volVocals == this.volVocals &&
          other.volGuitar == this.volGuitar &&
          other.volDrums == this.volDrums &&
          other.volBass == this.volBass &&
          other.volPiano == this.volPiano &&
          other.volOther == this.volOther);
}

class SongsCompanion extends UpdateCompanion<Song> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> artist;
  final Value<int> duration;
  final Value<DateTime> createdAt;
  final Value<String?> coverPath;
  final Value<double?> musicBpm;
  final Value<String?> musicKey;
  final Value<List<double>> musicBeatsPositions;
  final Value<String?> pathVocals;
  final Value<String?> pathGuitar;
  final Value<String?> pathDrums;
  final Value<String?> pathBass;
  final Value<String?> pathPiano;
  final Value<String?> pathOther;
  final Value<double> volMetronome;
  final Value<double> volVocals;
  final Value<double> volGuitar;
  final Value<double> volDrums;
  final Value<double> volBass;
  final Value<double> volPiano;
  final Value<double> volOther;
  const SongsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.duration = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.musicBpm = const Value.absent(),
    this.musicKey = const Value.absent(),
    this.musicBeatsPositions = const Value.absent(),
    this.pathVocals = const Value.absent(),
    this.pathGuitar = const Value.absent(),
    this.pathDrums = const Value.absent(),
    this.pathBass = const Value.absent(),
    this.pathPiano = const Value.absent(),
    this.pathOther = const Value.absent(),
    this.volMetronome = const Value.absent(),
    this.volVocals = const Value.absent(),
    this.volGuitar = const Value.absent(),
    this.volDrums = const Value.absent(),
    this.volBass = const Value.absent(),
    this.volPiano = const Value.absent(),
    this.volOther = const Value.absent(),
  });
  SongsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String artist,
    required int duration,
    this.createdAt = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.musicBpm = const Value.absent(),
    this.musicKey = const Value.absent(),
    required List<double> musicBeatsPositions,
    this.pathVocals = const Value.absent(),
    this.pathGuitar = const Value.absent(),
    this.pathDrums = const Value.absent(),
    this.pathBass = const Value.absent(),
    this.pathPiano = const Value.absent(),
    this.pathOther = const Value.absent(),
    this.volMetronome = const Value.absent(),
    this.volVocals = const Value.absent(),
    this.volGuitar = const Value.absent(),
    this.volDrums = const Value.absent(),
    this.volBass = const Value.absent(),
    this.volPiano = const Value.absent(),
    this.volOther = const Value.absent(),
  }) : title = Value(title),
       artist = Value(artist),
       duration = Value(duration),
       musicBeatsPositions = Value(musicBeatsPositions);
  static Insertable<Song> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<int>? duration,
    Expression<DateTime>? createdAt,
    Expression<String>? coverPath,
    Expression<double>? musicBpm,
    Expression<String>? musicKey,
    Expression<String>? musicBeatsPositions,
    Expression<String>? pathVocals,
    Expression<String>? pathGuitar,
    Expression<String>? pathDrums,
    Expression<String>? pathBass,
    Expression<String>? pathPiano,
    Expression<String>? pathOther,
    Expression<double>? volMetronome,
    Expression<double>? volVocals,
    Expression<double>? volGuitar,
    Expression<double>? volDrums,
    Expression<double>? volBass,
    Expression<double>? volPiano,
    Expression<double>? volOther,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (duration != null) 'duration': duration,
      if (createdAt != null) 'created_at': createdAt,
      if (coverPath != null) 'cover_path': coverPath,
      if (musicBpm != null) 'music_bpm': musicBpm,
      if (musicKey != null) 'music_key': musicKey,
      if (musicBeatsPositions != null)
        'music_beats_positions': musicBeatsPositions,
      if (pathVocals != null) 'path_vocals': pathVocals,
      if (pathGuitar != null) 'path_guitar': pathGuitar,
      if (pathDrums != null) 'path_drums': pathDrums,
      if (pathBass != null) 'path_bass': pathBass,
      if (pathPiano != null) 'path_piano': pathPiano,
      if (pathOther != null) 'path_other': pathOther,
      if (volMetronome != null) 'vol_metronome': volMetronome,
      if (volVocals != null) 'vol_vocals': volVocals,
      if (volGuitar != null) 'vol_guitar': volGuitar,
      if (volDrums != null) 'vol_drums': volDrums,
      if (volBass != null) 'vol_bass': volBass,
      if (volPiano != null) 'vol_piano': volPiano,
      if (volOther != null) 'vol_other': volOther,
    });
  }

  SongsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? artist,
    Value<int>? duration,
    Value<DateTime>? createdAt,
    Value<String?>? coverPath,
    Value<double?>? musicBpm,
    Value<String?>? musicKey,
    Value<List<double>>? musicBeatsPositions,
    Value<String?>? pathVocals,
    Value<String?>? pathGuitar,
    Value<String?>? pathDrums,
    Value<String?>? pathBass,
    Value<String?>? pathPiano,
    Value<String?>? pathOther,
    Value<double>? volMetronome,
    Value<double>? volVocals,
    Value<double>? volGuitar,
    Value<double>? volDrums,
    Value<double>? volBass,
    Value<double>? volPiano,
    Value<double>? volOther,
  }) {
    return SongsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
      coverPath: coverPath ?? this.coverPath,
      musicBpm: musicBpm ?? this.musicBpm,
      musicKey: musicKey ?? this.musicKey,
      musicBeatsPositions: musicBeatsPositions ?? this.musicBeatsPositions,
      pathVocals: pathVocals ?? this.pathVocals,
      pathGuitar: pathGuitar ?? this.pathGuitar,
      pathDrums: pathDrums ?? this.pathDrums,
      pathBass: pathBass ?? this.pathBass,
      pathPiano: pathPiano ?? this.pathPiano,
      pathOther: pathOther ?? this.pathOther,
      volMetronome: volMetronome ?? this.volMetronome,
      volVocals: volVocals ?? this.volVocals,
      volGuitar: volGuitar ?? this.volGuitar,
      volDrums: volDrums ?? this.volDrums,
      volBass: volBass ?? this.volBass,
      volPiano: volPiano ?? this.volPiano,
      volOther: volOther ?? this.volOther,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (coverPath.present) {
      map['cover_path'] = Variable<String>(coverPath.value);
    }
    if (musicBpm.present) {
      map['music_bpm'] = Variable<double>(musicBpm.value);
    }
    if (musicKey.present) {
      map['music_key'] = Variable<String>(musicKey.value);
    }
    if (musicBeatsPositions.present) {
      map['music_beats_positions'] = Variable<String>(
        $SongsTable.$convertermusicBeatsPositions.toSql(
          musicBeatsPositions.value,
        ),
      );
    }
    if (pathVocals.present) {
      map['path_vocals'] = Variable<String>(pathVocals.value);
    }
    if (pathGuitar.present) {
      map['path_guitar'] = Variable<String>(pathGuitar.value);
    }
    if (pathDrums.present) {
      map['path_drums'] = Variable<String>(pathDrums.value);
    }
    if (pathBass.present) {
      map['path_bass'] = Variable<String>(pathBass.value);
    }
    if (pathPiano.present) {
      map['path_piano'] = Variable<String>(pathPiano.value);
    }
    if (pathOther.present) {
      map['path_other'] = Variable<String>(pathOther.value);
    }
    if (volMetronome.present) {
      map['vol_metronome'] = Variable<double>(volMetronome.value);
    }
    if (volVocals.present) {
      map['vol_vocals'] = Variable<double>(volVocals.value);
    }
    if (volGuitar.present) {
      map['vol_guitar'] = Variable<double>(volGuitar.value);
    }
    if (volDrums.present) {
      map['vol_drums'] = Variable<double>(volDrums.value);
    }
    if (volBass.present) {
      map['vol_bass'] = Variable<double>(volBass.value);
    }
    if (volPiano.present) {
      map['vol_piano'] = Variable<double>(volPiano.value);
    }
    if (volOther.present) {
      map['vol_other'] = Variable<double>(volOther.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('duration: $duration, ')
          ..write('createdAt: $createdAt, ')
          ..write('coverPath: $coverPath, ')
          ..write('musicBpm: $musicBpm, ')
          ..write('musicKey: $musicKey, ')
          ..write('musicBeatsPositions: $musicBeatsPositions, ')
          ..write('pathVocals: $pathVocals, ')
          ..write('pathGuitar: $pathGuitar, ')
          ..write('pathDrums: $pathDrums, ')
          ..write('pathBass: $pathBass, ')
          ..write('pathPiano: $pathPiano, ')
          ..write('pathOther: $pathOther, ')
          ..write('volMetronome: $volMetronome, ')
          ..write('volVocals: $volVocals, ')
          ..write('volGuitar: $volGuitar, ')
          ..write('volDrums: $volDrums, ')
          ..write('volBass: $volBass, ')
          ..write('volPiano: $volPiano, ')
          ..write('volOther: $volOther')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SongsTable songs = $SongsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [songs];
}

typedef $$SongsTableCreateCompanionBuilder =
    SongsCompanion Function({
      Value<int> id,
      required String title,
      required String artist,
      required int duration,
      Value<DateTime> createdAt,
      Value<String?> coverPath,
      Value<double?> musicBpm,
      Value<String?> musicKey,
      required List<double> musicBeatsPositions,
      Value<String?> pathVocals,
      Value<String?> pathGuitar,
      Value<String?> pathDrums,
      Value<String?> pathBass,
      Value<String?> pathPiano,
      Value<String?> pathOther,
      Value<double> volMetronome,
      Value<double> volVocals,
      Value<double> volGuitar,
      Value<double> volDrums,
      Value<double> volBass,
      Value<double> volPiano,
      Value<double> volOther,
    });
typedef $$SongsTableUpdateCompanionBuilder =
    SongsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> artist,
      Value<int> duration,
      Value<DateTime> createdAt,
      Value<String?> coverPath,
      Value<double?> musicBpm,
      Value<String?> musicKey,
      Value<List<double>> musicBeatsPositions,
      Value<String?> pathVocals,
      Value<String?> pathGuitar,
      Value<String?> pathDrums,
      Value<String?> pathBass,
      Value<String?> pathPiano,
      Value<String?> pathOther,
      Value<double> volMetronome,
      Value<double> volVocals,
      Value<double> volGuitar,
      Value<double> volDrums,
      Value<double> volBass,
      Value<double> volPiano,
      Value<double> volOther,
    });

class $$SongsTableFilterComposer extends Composer<_$AppDatabase, $SongsTable> {
  $$SongsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverPath => $composableBuilder(
    column: $table.coverPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get musicBpm => $composableBuilder(
    column: $table.musicBpm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get musicKey => $composableBuilder(
    column: $table.musicKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<double>, List<double>, String>
  get musicBeatsPositions => $composableBuilder(
    column: $table.musicBeatsPositions,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get pathVocals => $composableBuilder(
    column: $table.pathVocals,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pathGuitar => $composableBuilder(
    column: $table.pathGuitar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pathDrums => $composableBuilder(
    column: $table.pathDrums,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pathBass => $composableBuilder(
    column: $table.pathBass,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pathPiano => $composableBuilder(
    column: $table.pathPiano,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pathOther => $composableBuilder(
    column: $table.pathOther,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volMetronome => $composableBuilder(
    column: $table.volMetronome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volVocals => $composableBuilder(
    column: $table.volVocals,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volGuitar => $composableBuilder(
    column: $table.volGuitar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volDrums => $composableBuilder(
    column: $table.volDrums,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volBass => $composableBuilder(
    column: $table.volBass,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volPiano => $composableBuilder(
    column: $table.volPiano,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volOther => $composableBuilder(
    column: $table.volOther,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SongsTableOrderingComposer
    extends Composer<_$AppDatabase, $SongsTable> {
  $$SongsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverPath => $composableBuilder(
    column: $table.coverPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get musicBpm => $composableBuilder(
    column: $table.musicBpm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get musicKey => $composableBuilder(
    column: $table.musicKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get musicBeatsPositions => $composableBuilder(
    column: $table.musicBeatsPositions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pathVocals => $composableBuilder(
    column: $table.pathVocals,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pathGuitar => $composableBuilder(
    column: $table.pathGuitar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pathDrums => $composableBuilder(
    column: $table.pathDrums,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pathBass => $composableBuilder(
    column: $table.pathBass,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pathPiano => $composableBuilder(
    column: $table.pathPiano,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pathOther => $composableBuilder(
    column: $table.pathOther,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volMetronome => $composableBuilder(
    column: $table.volMetronome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volVocals => $composableBuilder(
    column: $table.volVocals,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volGuitar => $composableBuilder(
    column: $table.volGuitar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volDrums => $composableBuilder(
    column: $table.volDrums,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volBass => $composableBuilder(
    column: $table.volBass,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volPiano => $composableBuilder(
    column: $table.volPiano,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volOther => $composableBuilder(
    column: $table.volOther,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SongsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SongsTable> {
  $$SongsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get artist =>
      $composableBuilder(column: $table.artist, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get coverPath =>
      $composableBuilder(column: $table.coverPath, builder: (column) => column);

  GeneratedColumn<double> get musicBpm =>
      $composableBuilder(column: $table.musicBpm, builder: (column) => column);

  GeneratedColumn<String> get musicKey =>
      $composableBuilder(column: $table.musicKey, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<double>, String>
  get musicBeatsPositions => $composableBuilder(
    column: $table.musicBeatsPositions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pathVocals => $composableBuilder(
    column: $table.pathVocals,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pathGuitar => $composableBuilder(
    column: $table.pathGuitar,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pathDrums =>
      $composableBuilder(column: $table.pathDrums, builder: (column) => column);

  GeneratedColumn<String> get pathBass =>
      $composableBuilder(column: $table.pathBass, builder: (column) => column);

  GeneratedColumn<String> get pathPiano =>
      $composableBuilder(column: $table.pathPiano, builder: (column) => column);

  GeneratedColumn<String> get pathOther =>
      $composableBuilder(column: $table.pathOther, builder: (column) => column);

  GeneratedColumn<double> get volMetronome => $composableBuilder(
    column: $table.volMetronome,
    builder: (column) => column,
  );

  GeneratedColumn<double> get volVocals =>
      $composableBuilder(column: $table.volVocals, builder: (column) => column);

  GeneratedColumn<double> get volGuitar =>
      $composableBuilder(column: $table.volGuitar, builder: (column) => column);

  GeneratedColumn<double> get volDrums =>
      $composableBuilder(column: $table.volDrums, builder: (column) => column);

  GeneratedColumn<double> get volBass =>
      $composableBuilder(column: $table.volBass, builder: (column) => column);

  GeneratedColumn<double> get volPiano =>
      $composableBuilder(column: $table.volPiano, builder: (column) => column);

  GeneratedColumn<double> get volOther =>
      $composableBuilder(column: $table.volOther, builder: (column) => column);
}

class $$SongsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SongsTable,
          Song,
          $$SongsTableFilterComposer,
          $$SongsTableOrderingComposer,
          $$SongsTableAnnotationComposer,
          $$SongsTableCreateCompanionBuilder,
          $$SongsTableUpdateCompanionBuilder,
          (Song, BaseReferences<_$AppDatabase, $SongsTable, Song>),
          Song,
          PrefetchHooks Function()
        > {
  $$SongsTableTableManager(_$AppDatabase db, $SongsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SongsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SongsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SongsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> artist = const Value.absent(),
                Value<int> duration = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> coverPath = const Value.absent(),
                Value<double?> musicBpm = const Value.absent(),
                Value<String?> musicKey = const Value.absent(),
                Value<List<double>> musicBeatsPositions = const Value.absent(),
                Value<String?> pathVocals = const Value.absent(),
                Value<String?> pathGuitar = const Value.absent(),
                Value<String?> pathDrums = const Value.absent(),
                Value<String?> pathBass = const Value.absent(),
                Value<String?> pathPiano = const Value.absent(),
                Value<String?> pathOther = const Value.absent(),
                Value<double> volMetronome = const Value.absent(),
                Value<double> volVocals = const Value.absent(),
                Value<double> volGuitar = const Value.absent(),
                Value<double> volDrums = const Value.absent(),
                Value<double> volBass = const Value.absent(),
                Value<double> volPiano = const Value.absent(),
                Value<double> volOther = const Value.absent(),
              }) => SongsCompanion(
                id: id,
                title: title,
                artist: artist,
                duration: duration,
                createdAt: createdAt,
                coverPath: coverPath,
                musicBpm: musicBpm,
                musicKey: musicKey,
                musicBeatsPositions: musicBeatsPositions,
                pathVocals: pathVocals,
                pathGuitar: pathGuitar,
                pathDrums: pathDrums,
                pathBass: pathBass,
                pathPiano: pathPiano,
                pathOther: pathOther,
                volMetronome: volMetronome,
                volVocals: volVocals,
                volGuitar: volGuitar,
                volDrums: volDrums,
                volBass: volBass,
                volPiano: volPiano,
                volOther: volOther,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String artist,
                required int duration,
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> coverPath = const Value.absent(),
                Value<double?> musicBpm = const Value.absent(),
                Value<String?> musicKey = const Value.absent(),
                required List<double> musicBeatsPositions,
                Value<String?> pathVocals = const Value.absent(),
                Value<String?> pathGuitar = const Value.absent(),
                Value<String?> pathDrums = const Value.absent(),
                Value<String?> pathBass = const Value.absent(),
                Value<String?> pathPiano = const Value.absent(),
                Value<String?> pathOther = const Value.absent(),
                Value<double> volMetronome = const Value.absent(),
                Value<double> volVocals = const Value.absent(),
                Value<double> volGuitar = const Value.absent(),
                Value<double> volDrums = const Value.absent(),
                Value<double> volBass = const Value.absent(),
                Value<double> volPiano = const Value.absent(),
                Value<double> volOther = const Value.absent(),
              }) => SongsCompanion.insert(
                id: id,
                title: title,
                artist: artist,
                duration: duration,
                createdAt: createdAt,
                coverPath: coverPath,
                musicBpm: musicBpm,
                musicKey: musicKey,
                musicBeatsPositions: musicBeatsPositions,
                pathVocals: pathVocals,
                pathGuitar: pathGuitar,
                pathDrums: pathDrums,
                pathBass: pathBass,
                pathPiano: pathPiano,
                pathOther: pathOther,
                volMetronome: volMetronome,
                volVocals: volVocals,
                volGuitar: volGuitar,
                volDrums: volDrums,
                volBass: volBass,
                volPiano: volPiano,
                volOther: volOther,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SongsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SongsTable,
      Song,
      $$SongsTableFilterComposer,
      $$SongsTableOrderingComposer,
      $$SongsTableAnnotationComposer,
      $$SongsTableCreateCompanionBuilder,
      $$SongsTableUpdateCompanionBuilder,
      (Song, BaseReferences<_$AppDatabase, $SongsTable, Song>),
      Song,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SongsTableTableManager get songs =>
      $$SongsTableTableManager(_db, _db.songs);
}
