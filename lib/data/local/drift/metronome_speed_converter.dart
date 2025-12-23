import 'package:drift/drift.dart';

enum MetronomeSpeed {
  half(4),
  normal(2),
  double(1);

  final int multiplier;
  const MetronomeSpeed(this.multiplier);
}

class MetronomeSpeedConverter extends TypeConverter<MetronomeSpeed, String> {
  const MetronomeSpeedConverter();

  @override
  MetronomeSpeed fromSql(String fromDb) {
    return MetronomeSpeed.values.byName(fromDb);
  }

  @override
  String toSql(MetronomeSpeed value) {
    return value.name;
  }
}
