// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeekDayTimeStruct extends BaseStruct {
  WeekDayTimeStruct({
    String? time,
    String? day,
  })  : _time = time,
        _day = day;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  set day(String? val) => _day = val;

  bool hasDay() => _day != null;

  static WeekDayTimeStruct fromMap(Map<String, dynamic> data) =>
      WeekDayTimeStruct(
        time: data['time'] as String?,
        day: data['day'] as String?,
      );

  static WeekDayTimeStruct? maybeFromMap(dynamic data) => data is Map
      ? WeekDayTimeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'day': _day,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'day': serializeParam(
          _day,
          ParamType.String,
        ),
      }.withoutNulls;

  static WeekDayTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeekDayTimeStruct(
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        day: deserializeParam(
          data['day'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WeekDayTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeekDayTimeStruct && time == other.time && day == other.day;
  }

  @override
  int get hashCode => const ListEquality().hash([time, day]);
}

WeekDayTimeStruct createWeekDayTimeStruct({
  String? time,
  String? day,
}) =>
    WeekDayTimeStruct(
      time: time,
      day: day,
    );
