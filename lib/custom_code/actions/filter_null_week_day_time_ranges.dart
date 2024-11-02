// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<WeekDayTimeRangeStruct>?> filterNullWeekDayTimeRanges(
    List<WeekDayTimeRangeStruct>? list) async {
  if (list == null) return null;
  list = list
      .where((element) =>
          element != null &&
          element.startTime != null &&
          element.startTime.time != null)
      .toList();
  print(list);
  return list;

  // Add your function code here!
}
