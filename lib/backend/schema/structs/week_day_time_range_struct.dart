// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeekDayTimeRangeStruct extends BaseStruct {
  WeekDayTimeRangeStruct({
    WeekDayTimeStruct? startTime,
    WeekDayTimeStruct? endTime,
  })  : _startTime = startTime,
        _endTime = endTime;

  // "startTime" field.
  WeekDayTimeStruct? _startTime;
  WeekDayTimeStruct get startTime => _startTime ?? WeekDayTimeStruct();
  set startTime(WeekDayTimeStruct? val) => _startTime = val;

  void updateStartTime(Function(WeekDayTimeStruct) updateFn) {
    updateFn(_startTime ??= WeekDayTimeStruct());
  }

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  WeekDayTimeStruct? _endTime;
  WeekDayTimeStruct get endTime => _endTime ?? WeekDayTimeStruct();
  set endTime(WeekDayTimeStruct? val) => _endTime = val;

  void updateEndTime(Function(WeekDayTimeStruct) updateFn) {
    updateFn(_endTime ??= WeekDayTimeStruct());
  }

  bool hasEndTime() => _endTime != null;

  static WeekDayTimeRangeStruct fromMap(Map<String, dynamic> data) =>
      WeekDayTimeRangeStruct(
        startTime: WeekDayTimeStruct.maybeFromMap(data['startTime']),
        endTime: WeekDayTimeStruct.maybeFromMap(data['endTime']),
      );

  static WeekDayTimeRangeStruct? maybeFromMap(dynamic data) => data is Map
      ? WeekDayTimeRangeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'startTime': _startTime?.toMap(),
        'endTime': _endTime?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startTime': serializeParam(
          _startTime,
          ParamType.DataStruct,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WeekDayTimeRangeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WeekDayTimeRangeStruct(
        startTime: deserializeStructParam(
          data['startTime'],
          ParamType.DataStruct,
          false,
          structBuilder: WeekDayTimeStruct.fromSerializableMap,
        ),
        endTime: deserializeStructParam(
          data['endTime'],
          ParamType.DataStruct,
          false,
          structBuilder: WeekDayTimeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WeekDayTimeRangeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeekDayTimeRangeStruct &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode => const ListEquality().hash([startTime, endTime]);
}

WeekDayTimeRangeStruct createWeekDayTimeRangeStruct({
  WeekDayTimeStruct? startTime,
  WeekDayTimeStruct? endTime,
}) =>
    WeekDayTimeRangeStruct(
      startTime: startTime ?? WeekDayTimeStruct(),
      endTime: endTime ?? WeekDayTimeStruct(),
    );
