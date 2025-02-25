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

import 'package:cron_expression_descriptor/cron_expression_descriptor.dart';

Future<String?> describeCron(String? cronValue) async {
  // Add your function code here!
  if (cronValue == null) return null;
  cronValue = cronValue.trim();
  var cronValues = cronValue.split(" ");

  if (cronValues.length == 5) {
  } else if (cronValues.length == 6) {
    cronValues = cronValues.sublist(1);
  } else {
    return cronValue;
  }

  return CronExpressionDescriptor()
      .convertCronToHumanReadable(cronExpression: cronValues.join(" "));
}
