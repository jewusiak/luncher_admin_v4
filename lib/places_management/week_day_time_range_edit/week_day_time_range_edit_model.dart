import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'week_day_time_range_edit_widget.dart' show WeekDayTimeRangeEditWidget;
import 'package:flutter/material.dart';

class WeekDayTimeRangeEditModel
    extends FlutterFlowModel<WeekDayTimeRangeEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for StartDayDD widget.
  String? startDayDDValue;
  FormFieldController<String>? startDayDDValueController;
  // Stores action output result for [Custom Action - show24hTimePicker] action in StartPickerBtn widget.
  String? startTimePicker;
  // State field(s) for EndDayDD widget.
  String? endDayDDValue;
  FormFieldController<String>? endDayDDValueController;
  // Stores action output result for [Custom Action - show24hTimePicker] action in EndPickerBtn widget.
  String? endTimePicker;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
