import 'dart:convert';
import 'package:drift/drift.dart';

/// Converts a List of double to a JSON-encoded String
/// and vice versa, for storing in the database.
class ListConverter extends TypeConverter<List<double>, String> {
  const ListConverter();

  @override
  List<double> fromSql(String fromDb) {
    return (json.decode(fromDb) as List).cast<double>();
  }

  @override
  String toSql(List<double> value) {
    return json.encode(value);
  }
}
