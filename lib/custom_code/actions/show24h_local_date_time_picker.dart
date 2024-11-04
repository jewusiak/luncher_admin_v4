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

Future<String?> show24hLocalDateTimePicker(
  BuildContext context,
  String? initialDateTime,
) async {
  // Add your function code here!
  DateTime? initTime =
      initialDateTime != null ? DateTime.tryParse(initialDateTime) : null;
  initTime ??= DateTime.now();

  DateTime? date = await showDatePicker(
      context: context,
      initialDate: initTime,
      firstDate: initTime.subtract(Duration(days: 365 * 1)),
      lastDate: initTime.add(Duration(days: 365 * 5)));

  if (date == null) return initialDateTime;

  TimeOfDay? time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(initTime),
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );
    },
  );
  if (time == null) return initialDateTime;

  return DateTime(date.year, date.month, date.day, time.hour, time.minute)
      .toIso8601String();
}
