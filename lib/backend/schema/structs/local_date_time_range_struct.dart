// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalDateTimeRangeStruct extends BaseStruct {
  LocalDateTimeRangeStruct({
    String? startTime,
    String? endTime,
  })  : _startTime = startTime,
        _endTime = endTime;

  // "startTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  static LocalDateTimeRangeStruct fromMap(Map<String, dynamic> data) =>
      LocalDateTimeRangeStruct(
        startTime: data['startTime'] as String?,
        endTime: data['endTime'] as String?,
      );

  static LocalDateTimeRangeStruct? maybeFromMap(dynamic data) => data is Map
      ? LocalDateTimeRangeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'startTime': _startTime,
        'endTime': _endTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startTime': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocalDateTimeRangeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LocalDateTimeRangeStruct(
        startTime: deserializeParam(
          data['startTime'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocalDateTimeRangeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocalDateTimeRangeStruct &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode => const ListEquality().hash([startTime, endTime]);
}

LocalDateTimeRangeStruct createLocalDateTimeRangeStruct({
  String? startTime,
  String? endTime,
}) =>
    LocalDateTimeRangeStruct(
      startTime: startTime,
      endTime: endTime,
    );
