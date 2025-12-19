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
  static const VerificationMeta _vocalsPathMeta = const VerificationMeta(
    'vocalsPath',
  );
  @override
  late final GeneratedColumn<String> vocalsPath = GeneratedColumn<String>(
    'vocals_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guitarPathMeta = const VerificationMeta(
    'guitarPath',
  );
  @override
  late final GeneratedColumn<String> guitarPath = GeneratedColumn<String>(
    'guitar_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _drumsPathMeta = const VerificationMeta(
    'drumsPath',
  );
  @override
  late final GeneratedColumn<String> drumsPath = GeneratedColumn<String>(
    'drums_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bassPathMeta = const VerificationMeta(
    'bassPath',
  );
  @override
  late final GeneratedColumn<String> bassPath = GeneratedColumn<String>(
    'bass_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pianoPathMeta = const VerificationMeta(
    'pianoPath',
  );
  @override
  late final GeneratedColumn<String> pianoPath = GeneratedColumn<String>(
    'piano_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _otherPathMeta = const VerificationMeta(
    'otherPath',
  );
  @override
  late final GeneratedColumn<String> otherPath = GeneratedColumn<String>(
    'other_path',
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
  static const VerificationMeta _vocalsVolMeta = const VerificationMeta(
    'vocalsVol',
  );
  @override
  late final GeneratedColumn<double> vocalsVol = GeneratedColumn<double>(
    'vocals_vol',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _guitarVolMeta = const VerificationMeta(
    'guitarVol',
  );
  @override
  late final GeneratedColumn<double> guitarVol = GeneratedColumn<double>(
    'guitar_vol',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _drumsVolMeta = const VerificationMeta(
    'drumsVol',
  );
  @override
  late final GeneratedColumn<double> drumsVol = GeneratedColumn<double>(
    'drums_vol',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _bassVolMeta = const VerificationMeta(
    'bassVol',
  );
  @override
  late final GeneratedColumn<double> bassVol = GeneratedColumn<double>(
    'bass_vol',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _pianoVolMeta = const VerificationMeta(
    'pianoVol',
  );
  @override
  late final GeneratedColumn<double> pianoVol = GeneratedColumn<double>(
    'piano_vol',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _otherVolMeta = const VerificationMeta(
    'otherVol',
  );
  @override
  late final GeneratedColumn<double> otherVol = GeneratedColumn<double>(
    'other_vol',
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
    vocalsPath,
    guitarPath,
    drumsPath,
    bassPath,
    pianoPath,
    otherPath,
    volMetronome,
    vocalsVol,
    guitarVol,
    drumsVol,
    bassVol,
    pianoVol,
    otherVol,
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
    if (data.containsKey('vocals_path')) {
      context.handle(
        _vocalsPathMeta,
        vocalsPath.isAcceptableOrUnknown(data['vocals_path']!, _vocalsPathMeta),
      );
    }
    if (data.containsKey('guitar_path')) {
      context.handle(
        _guitarPathMeta,
        guitarPath.isAcceptableOrUnknown(data['guitar_path']!, _guitarPathMeta),
      );
    }
    if (data.containsKey('drums_path')) {
      context.handle(
        _drumsPathMeta,
        drumsPath.isAcceptableOrUnknown(data['drums_path']!, _drumsPathMeta),
      );
    }
    if (data.containsKey('bass_path')) {
      context.handle(
        _bassPathMeta,
        bassPath.isAcceptableOrUnknown(data['bass_path']!, _bassPathMeta),
      );
    }
    if (data.containsKey('piano_path')) {
      context.handle(
        _pianoPathMeta,
        pianoPath.isAcceptableOrUnknown(data['piano_path']!, _pianoPathMeta),
      );
    }
    if (data.containsKey('other_path')) {
      context.handle(
        _otherPathMeta,
        otherPath.isAcceptableOrUnknown(data['other_path']!, _otherPathMeta),
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
    if (data.containsKey('vocals_vol')) {
      context.handle(
        _vocalsVolMeta,
        vocalsVol.isAcceptableOrUnknown(data['vocals_vol']!, _vocalsVolMeta),
      );
    }
    if (data.containsKey('guitar_vol')) {
      context.handle(
        _guitarVolMeta,
        guitarVol.isAcceptableOrUnknown(data['guitar_vol']!, _guitarVolMeta),
      );
    }
    if (data.containsKey('drums_vol')) {
      context.handle(
        _drumsVolMeta,
        drumsVol.isAcceptableOrUnknown(data['drums_vol']!, _drumsVolMeta),
      );
    }
    if (data.containsKey('bass_vol')) {
      context.handle(
        _bassVolMeta,
        bassVol.isAcceptableOrUnknown(data['bass_vol']!, _bassVolMeta),
      );
    }
    if (data.containsKey('piano_vol')) {
      context.handle(
        _pianoVolMeta,
        pianoVol.isAcceptableOrUnknown(data['piano_vol']!, _pianoVolMeta),
      );
    }
    if (data.containsKey('other_vol')) {
      context.handle(
        _otherVolMeta,
        otherVol.isAcceptableOrUnknown(data['other_vol']!, _otherVolMeta),
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
      vocalsPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vocals_path'],
      ),
      guitarPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guitar_path'],
      ),
      drumsPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}drums_path'],
      ),
      bassPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bass_path'],
      ),
      pianoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}piano_path'],
      ),
      otherPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}other_path'],
      ),
      volMetronome: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vol_metronome'],
      )!,
      vocalsVol: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vocals_vol'],
      )!,
      guitarVol: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}guitar_vol'],
      )!,
      drumsVol: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}drums_vol'],
      )!,
      bassVol: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bass_vol'],
      )!,
      pianoVol: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}piano_vol'],
      )!,
      otherVol: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}other_vol'],
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
  final String? vocalsPath;
  final String? guitarPath;
  final String? drumsPath;
  final String? bassPath;
  final String? pianoPath;
  final String? otherPath;
  final double volMetronome;
  final double vocalsVol;
  final double guitarVol;
  final double drumsVol;
  final double bassVol;
  final double pianoVol;
  final double otherVol;
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
    this.vocalsPath,
    this.guitarPath,
    this.drumsPath,
    this.bassPath,
    this.pianoPath,
    this.otherPath,
    required this.volMetronome,
    required this.vocalsVol,
    required this.guitarVol,
    required this.drumsVol,
    required this.bassVol,
    required this.pianoVol,
    required this.otherVol,
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
    if (!nullToAbsent || vocalsPath != null) {
      map['vocals_path'] = Variable<String>(vocalsPath);
    }
    if (!nullToAbsent || guitarPath != null) {
      map['guitar_path'] = Variable<String>(guitarPath);
    }
    if (!nullToAbsent || drumsPath != null) {
      map['drums_path'] = Variable<String>(drumsPath);
    }
    if (!nullToAbsent || bassPath != null) {
      map['bass_path'] = Variable<String>(bassPath);
    }
    if (!nullToAbsent || pianoPath != null) {
      map['piano_path'] = Variable<String>(pianoPath);
    }
    if (!nullToAbsent || otherPath != null) {
      map['other_path'] = Variable<String>(otherPath);
    }
    map['vol_metronome'] = Variable<double>(volMetronome);
    map['vocals_vol'] = Variable<double>(vocalsVol);
    map['guitar_vol'] = Variable<double>(guitarVol);
    map['drums_vol'] = Variable<double>(drumsVol);
    map['bass_vol'] = Variable<double>(bassVol);
    map['piano_vol'] = Variable<double>(pianoVol);
    map['other_vol'] = Variable<double>(otherVol);
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
      vocalsPath: vocalsPath == null && nullToAbsent
          ? const Value.absent()
          : Value(vocalsPath),
      guitarPath: guitarPath == null && nullToAbsent
          ? const Value.absent()
          : Value(guitarPath),
      drumsPath: drumsPath == null && nullToAbsent
          ? const Value.absent()
          : Value(drumsPath),
      bassPath: bassPath == null && nullToAbsent
          ? const Value.absent()
          : Value(bassPath),
      pianoPath: pianoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(pianoPath),
      otherPath: otherPath == null && nullToAbsent
          ? const Value.absent()
          : Value(otherPath),
      volMetronome: Value(volMetronome),
      vocalsVol: Value(vocalsVol),
      guitarVol: Value(guitarVol),
      drumsVol: Value(drumsVol),
      bassVol: Value(bassVol),
      pianoVol: Value(pianoVol),
      otherVol: Value(otherVol),
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
      vocalsPath: serializer.fromJson<String?>(json['vocalsPath']),
      guitarPath: serializer.fromJson<String?>(json['guitarPath']),
      drumsPath: serializer.fromJson<String?>(json['drumsPath']),
      bassPath: serializer.fromJson<String?>(json['bassPath']),
      pianoPath: serializer.fromJson<String?>(json['pianoPath']),
      otherPath: serializer.fromJson<String?>(json['otherPath']),
      volMetronome: serializer.fromJson<double>(json['volMetronome']),
      vocalsVol: serializer.fromJson<double>(json['vocalsVol']),
      guitarVol: serializer.fromJson<double>(json['guitarVol']),
      drumsVol: serializer.fromJson<double>(json['drumsVol']),
      bassVol: serializer.fromJson<double>(json['bassVol']),
      pianoVol: serializer.fromJson<double>(json['pianoVol']),
      otherVol: serializer.fromJson<double>(json['otherVol']),
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
      'vocalsPath': serializer.toJson<String?>(vocalsPath),
      'guitarPath': serializer.toJson<String?>(guitarPath),
      'drumsPath': serializer.toJson<String?>(drumsPath),
      'bassPath': serializer.toJson<String?>(bassPath),
      'pianoPath': serializer.toJson<String?>(pianoPath),
      'otherPath': serializer.toJson<String?>(otherPath),
      'volMetronome': serializer.toJson<double>(volMetronome),
      'vocalsVol': serializer.toJson<double>(vocalsVol),
      'guitarVol': serializer.toJson<double>(guitarVol),
      'drumsVol': serializer.toJson<double>(drumsVol),
      'bassVol': serializer.toJson<double>(bassVol),
      'pianoVol': serializer.toJson<double>(pianoVol),
      'otherVol': serializer.toJson<double>(otherVol),
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
    Value<String?> vocalsPath = const Value.absent(),
    Value<String?> guitarPath = const Value.absent(),
    Value<String?> drumsPath = const Value.absent(),
    Value<String?> bassPath = const Value.absent(),
    Value<String?> pianoPath = const Value.absent(),
    Value<String?> otherPath = const Value.absent(),
    double? volMetronome,
    double? vocalsVol,
    double? guitarVol,
    double? drumsVol,
    double? bassVol,
    double? pianoVol,
    double? otherVol,
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
    vocalsPath: vocalsPath.present ? vocalsPath.value : this.vocalsPath,
    guitarPath: guitarPath.present ? guitarPath.value : this.guitarPath,
    drumsPath: drumsPath.present ? drumsPath.value : this.drumsPath,
    bassPath: bassPath.present ? bassPath.value : this.bassPath,
    pianoPath: pianoPath.present ? pianoPath.value : this.pianoPath,
    otherPath: otherPath.present ? otherPath.value : this.otherPath,
    volMetronome: volMetronome ?? this.volMetronome,
    vocalsVol: vocalsVol ?? this.vocalsVol,
    guitarVol: guitarVol ?? this.guitarVol,
    drumsVol: drumsVol ?? this.drumsVol,
    bassVol: bassVol ?? this.bassVol,
    pianoVol: pianoVol ?? this.pianoVol,
    otherVol: otherVol ?? this.otherVol,
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
      vocalsPath: data.vocalsPath.present
          ? data.vocalsPath.value
          : this.vocalsPath,
      guitarPath: data.guitarPath.present
          ? data.guitarPath.value
          : this.guitarPath,
      drumsPath: data.drumsPath.present ? data.drumsPath.value : this.drumsPath,
      bassPath: data.bassPath.present ? data.bassPath.value : this.bassPath,
      pianoPath: data.pianoPath.present ? data.pianoPath.value : this.pianoPath,
      otherPath: data.otherPath.present ? data.otherPath.value : this.otherPath,
      volMetronome: data.volMetronome.present
          ? data.volMetronome.value
          : this.volMetronome,
      vocalsVol: data.vocalsVol.present ? data.vocalsVol.value : this.vocalsVol,
      guitarVol: data.guitarVol.present ? data.guitarVol.value : this.guitarVol,
      drumsVol: data.drumsVol.present ? data.drumsVol.value : this.drumsVol,
      bassVol: data.bassVol.present ? data.bassVol.value : this.bassVol,
      pianoVol: data.pianoVol.present ? data.pianoVol.value : this.pianoVol,
      otherVol: data.otherVol.present ? data.otherVol.value : this.otherVol,
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
          ..write('vocalsPath: $vocalsPath, ')
          ..write('guitarPath: $guitarPath, ')
          ..write('drumsPath: $drumsPath, ')
          ..write('bassPath: $bassPath, ')
          ..write('pianoPath: $pianoPath, ')
          ..write('otherPath: $otherPath, ')
          ..write('volMetronome: $volMetronome, ')
          ..write('vocalsVol: $vocalsVol, ')
          ..write('guitarVol: $guitarVol, ')
          ..write('drumsVol: $drumsVol, ')
          ..write('bassVol: $bassVol, ')
          ..write('pianoVol: $pianoVol, ')
          ..write('otherVol: $otherVol')
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
    vocalsPath,
    guitarPath,
    drumsPath,
    bassPath,
    pianoPath,
    otherPath,
    volMetronome,
    vocalsVol,
    guitarVol,
    drumsVol,
    bassVol,
    pianoVol,
    otherVol,
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
          other.vocalsPath == this.vocalsPath &&
          other.guitarPath == this.guitarPath &&
          other.drumsPath == this.drumsPath &&
          other.bassPath == this.bassPath &&
          other.pianoPath == this.pianoPath &&
          other.otherPath == this.otherPath &&
          other.volMetronome == this.volMetronome &&
          other.vocalsVol == this.vocalsVol &&
          other.guitarVol == this.guitarVol &&
          other.drumsVol == this.drumsVol &&
          other.bassVol == this.bassVol &&
          other.pianoVol == this.pianoVol &&
          other.otherVol == this.otherVol);
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
  final Value<String?> vocalsPath;
  final Value<String?> guitarPath;
  final Value<String?> drumsPath;
  final Value<String?> bassPath;
  final Value<String?> pianoPath;
  final Value<String?> otherPath;
  final Value<double> volMetronome;
  final Value<double> vocalsVol;
  final Value<double> guitarVol;
  final Value<double> drumsVol;
  final Value<double> bassVol;
  final Value<double> pianoVol;
  final Value<double> otherVol;
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
    this.vocalsPath = const Value.absent(),
    this.guitarPath = const Value.absent(),
    this.drumsPath = const Value.absent(),
    this.bassPath = const Value.absent(),
    this.pianoPath = const Value.absent(),
    this.otherPath = const Value.absent(),
    this.volMetronome = const Value.absent(),
    this.vocalsVol = const Value.absent(),
    this.guitarVol = const Value.absent(),
    this.drumsVol = const Value.absent(),
    this.bassVol = const Value.absent(),
    this.pianoVol = const Value.absent(),
    this.otherVol = const Value.absent(),
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
    this.vocalsPath = const Value.absent(),
    this.guitarPath = const Value.absent(),
    this.drumsPath = const Value.absent(),
    this.bassPath = const Value.absent(),
    this.pianoPath = const Value.absent(),
    this.otherPath = const Value.absent(),
    this.volMetronome = const Value.absent(),
    this.vocalsVol = const Value.absent(),
    this.guitarVol = const Value.absent(),
    this.drumsVol = const Value.absent(),
    this.bassVol = const Value.absent(),
    this.pianoVol = const Value.absent(),
    this.otherVol = const Value.absent(),
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
    Expression<String>? vocalsPath,
    Expression<String>? guitarPath,
    Expression<String>? drumsPath,
    Expression<String>? bassPath,
    Expression<String>? pianoPath,
    Expression<String>? otherPath,
    Expression<double>? volMetronome,
    Expression<double>? vocalsVol,
    Expression<double>? guitarVol,
    Expression<double>? drumsVol,
    Expression<double>? bassVol,
    Expression<double>? pianoVol,
    Expression<double>? otherVol,
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
      if (vocalsPath != null) 'vocals_path': vocalsPath,
      if (guitarPath != null) 'guitar_path': guitarPath,
      if (drumsPath != null) 'drums_path': drumsPath,
      if (bassPath != null) 'bass_path': bassPath,
      if (pianoPath != null) 'piano_path': pianoPath,
      if (otherPath != null) 'other_path': otherPath,
      if (volMetronome != null) 'vol_metronome': volMetronome,
      if (vocalsVol != null) 'vocals_vol': vocalsVol,
      if (guitarVol != null) 'guitar_vol': guitarVol,
      if (drumsVol != null) 'drums_vol': drumsVol,
      if (bassVol != null) 'bass_vol': bassVol,
      if (pianoVol != null) 'piano_vol': pianoVol,
      if (otherVol != null) 'other_vol': otherVol,
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
    Value<String?>? vocalsPath,
    Value<String?>? guitarPath,
    Value<String?>? drumsPath,
    Value<String?>? bassPath,
    Value<String?>? pianoPath,
    Value<String?>? otherPath,
    Value<double>? volMetronome,
    Value<double>? vocalsVol,
    Value<double>? guitarVol,
    Value<double>? drumsVol,
    Value<double>? bassVol,
    Value<double>? pianoVol,
    Value<double>? otherVol,
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
      vocalsPath: vocalsPath ?? this.vocalsPath,
      guitarPath: guitarPath ?? this.guitarPath,
      drumsPath: drumsPath ?? this.drumsPath,
      bassPath: bassPath ?? this.bassPath,
      pianoPath: pianoPath ?? this.pianoPath,
      otherPath: otherPath ?? this.otherPath,
      volMetronome: volMetronome ?? this.volMetronome,
      vocalsVol: vocalsVol ?? this.vocalsVol,
      guitarVol: guitarVol ?? this.guitarVol,
      drumsVol: drumsVol ?? this.drumsVol,
      bassVol: bassVol ?? this.bassVol,
      pianoVol: pianoVol ?? this.pianoVol,
      otherVol: otherVol ?? this.otherVol,
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
    if (vocalsPath.present) {
      map['vocals_path'] = Variable<String>(vocalsPath.value);
    }
    if (guitarPath.present) {
      map['guitar_path'] = Variable<String>(guitarPath.value);
    }
    if (drumsPath.present) {
      map['drums_path'] = Variable<String>(drumsPath.value);
    }
    if (bassPath.present) {
      map['bass_path'] = Variable<String>(bassPath.value);
    }
    if (pianoPath.present) {
      map['piano_path'] = Variable<String>(pianoPath.value);
    }
    if (otherPath.present) {
      map['other_path'] = Variable<String>(otherPath.value);
    }
    if (volMetronome.present) {
      map['vol_metronome'] = Variable<double>(volMetronome.value);
    }
    if (vocalsVol.present) {
      map['vocals_vol'] = Variable<double>(vocalsVol.value);
    }
    if (guitarVol.present) {
      map['guitar_vol'] = Variable<double>(guitarVol.value);
    }
    if (drumsVol.present) {
      map['drums_vol'] = Variable<double>(drumsVol.value);
    }
    if (bassVol.present) {
      map['bass_vol'] = Variable<double>(bassVol.value);
    }
    if (pianoVol.present) {
      map['piano_vol'] = Variable<double>(pianoVol.value);
    }
    if (otherVol.present) {
      map['other_vol'] = Variable<double>(otherVol.value);
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
          ..write('vocalsPath: $vocalsPath, ')
          ..write('guitarPath: $guitarPath, ')
          ..write('drumsPath: $drumsPath, ')
          ..write('bassPath: $bassPath, ')
          ..write('pianoPath: $pianoPath, ')
          ..write('otherPath: $otherPath, ')
          ..write('volMetronome: $volMetronome, ')
          ..write('vocalsVol: $vocalsVol, ')
          ..write('guitarVol: $guitarVol, ')
          ..write('drumsVol: $drumsVol, ')
          ..write('bassVol: $bassVol, ')
          ..write('pianoVol: $pianoVol, ')
          ..write('otherVol: $otherVol')
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
      Value<String?> vocalsPath,
      Value<String?> guitarPath,
      Value<String?> drumsPath,
      Value<String?> bassPath,
      Value<String?> pianoPath,
      Value<String?> otherPath,
      Value<double> volMetronome,
      Value<double> vocalsVol,
      Value<double> guitarVol,
      Value<double> drumsVol,
      Value<double> bassVol,
      Value<double> pianoVol,
      Value<double> otherVol,
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
      Value<String?> vocalsPath,
      Value<String?> guitarPath,
      Value<String?> drumsPath,
      Value<String?> bassPath,
      Value<String?> pianoPath,
      Value<String?> otherPath,
      Value<double> volMetronome,
      Value<double> vocalsVol,
      Value<double> guitarVol,
      Value<double> drumsVol,
      Value<double> bassVol,
      Value<double> pianoVol,
      Value<double> otherVol,
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

  ColumnFilters<String> get vocalsPath => $composableBuilder(
    column: $table.vocalsPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guitarPath => $composableBuilder(
    column: $table.guitarPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get drumsPath => $composableBuilder(
    column: $table.drumsPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bassPath => $composableBuilder(
    column: $table.bassPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pianoPath => $composableBuilder(
    column: $table.pianoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get otherPath => $composableBuilder(
    column: $table.otherPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volMetronome => $composableBuilder(
    column: $table.volMetronome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get vocalsVol => $composableBuilder(
    column: $table.vocalsVol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get guitarVol => $composableBuilder(
    column: $table.guitarVol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get drumsVol => $composableBuilder(
    column: $table.drumsVol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bassVol => $composableBuilder(
    column: $table.bassVol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pianoVol => $composableBuilder(
    column: $table.pianoVol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get otherVol => $composableBuilder(
    column: $table.otherVol,
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

  ColumnOrderings<String> get vocalsPath => $composableBuilder(
    column: $table.vocalsPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guitarPath => $composableBuilder(
    column: $table.guitarPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get drumsPath => $composableBuilder(
    column: $table.drumsPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bassPath => $composableBuilder(
    column: $table.bassPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pianoPath => $composableBuilder(
    column: $table.pianoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get otherPath => $composableBuilder(
    column: $table.otherPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volMetronome => $composableBuilder(
    column: $table.volMetronome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get vocalsVol => $composableBuilder(
    column: $table.vocalsVol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get guitarVol => $composableBuilder(
    column: $table.guitarVol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get drumsVol => $composableBuilder(
    column: $table.drumsVol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bassVol => $composableBuilder(
    column: $table.bassVol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pianoVol => $composableBuilder(
    column: $table.pianoVol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get otherVol => $composableBuilder(
    column: $table.otherVol,
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

  GeneratedColumn<String> get vocalsPath => $composableBuilder(
    column: $table.vocalsPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get guitarPath => $composableBuilder(
    column: $table.guitarPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get drumsPath =>
      $composableBuilder(column: $table.drumsPath, builder: (column) => column);

  GeneratedColumn<String> get bassPath =>
      $composableBuilder(column: $table.bassPath, builder: (column) => column);

  GeneratedColumn<String> get pianoPath =>
      $composableBuilder(column: $table.pianoPath, builder: (column) => column);

  GeneratedColumn<String> get otherPath =>
      $composableBuilder(column: $table.otherPath, builder: (column) => column);

  GeneratedColumn<double> get volMetronome => $composableBuilder(
    column: $table.volMetronome,
    builder: (column) => column,
  );

  GeneratedColumn<double> get vocalsVol =>
      $composableBuilder(column: $table.vocalsVol, builder: (column) => column);

  GeneratedColumn<double> get guitarVol =>
      $composableBuilder(column: $table.guitarVol, builder: (column) => column);

  GeneratedColumn<double> get drumsVol =>
      $composableBuilder(column: $table.drumsVol, builder: (column) => column);

  GeneratedColumn<double> get bassVol =>
      $composableBuilder(column: $table.bassVol, builder: (column) => column);

  GeneratedColumn<double> get pianoVol =>
      $composableBuilder(column: $table.pianoVol, builder: (column) => column);

  GeneratedColumn<double> get otherVol =>
      $composableBuilder(column: $table.otherVol, builder: (column) => column);
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
                Value<String?> vocalsPath = const Value.absent(),
                Value<String?> guitarPath = const Value.absent(),
                Value<String?> drumsPath = const Value.absent(),
                Value<String?> bassPath = const Value.absent(),
                Value<String?> pianoPath = const Value.absent(),
                Value<String?> otherPath = const Value.absent(),
                Value<double> volMetronome = const Value.absent(),
                Value<double> vocalsVol = const Value.absent(),
                Value<double> guitarVol = const Value.absent(),
                Value<double> drumsVol = const Value.absent(),
                Value<double> bassVol = const Value.absent(),
                Value<double> pianoVol = const Value.absent(),
                Value<double> otherVol = const Value.absent(),
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
                vocalsPath: vocalsPath,
                guitarPath: guitarPath,
                drumsPath: drumsPath,
                bassPath: bassPath,
                pianoPath: pianoPath,
                otherPath: otherPath,
                volMetronome: volMetronome,
                vocalsVol: vocalsVol,
                guitarVol: guitarVol,
                drumsVol: drumsVol,
                bassVol: bassVol,
                pianoVol: pianoVol,
                otherVol: otherVol,
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
                Value<String?> vocalsPath = const Value.absent(),
                Value<String?> guitarPath = const Value.absent(),
                Value<String?> drumsPath = const Value.absent(),
                Value<String?> bassPath = const Value.absent(),
                Value<String?> pianoPath = const Value.absent(),
                Value<String?> otherPath = const Value.absent(),
                Value<double> volMetronome = const Value.absent(),
                Value<double> vocalsVol = const Value.absent(),
                Value<double> guitarVol = const Value.absent(),
                Value<double> drumsVol = const Value.absent(),
                Value<double> bassVol = const Value.absent(),
                Value<double> pianoVol = const Value.absent(),
                Value<double> otherVol = const Value.absent(),
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
                vocalsPath: vocalsPath,
                guitarPath: guitarPath,
                drumsPath: drumsPath,
                bassPath: bassPath,
                pianoPath: pianoPath,
                otherPath: otherPath,
                volMetronome: volMetronome,
                vocalsVol: vocalsVol,
                guitarVol: guitarVol,
                drumsVol: drumsVol,
                bassVol: bassVol,
                pianoVol: pianoVol,
                otherVol: otherVol,
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
