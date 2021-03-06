library dartson.transformers.DateTime;

import 'package:dartson/dartson.dart';

/// A simple DateTime transformer which uses the toString() method.
@Deprecated('A default implementation is now available using ISO-8601.')
class DateTimeParser implements TypeTransformer<String, DateTime> {
  const DateTimeParser();
  DateTime decode(String value) =>
      value != null ? DateTime.parse(value) : value;
  String encode(DateTime value) =>
      value != null ? value.toUtc().toIso8601String() : value;
}
