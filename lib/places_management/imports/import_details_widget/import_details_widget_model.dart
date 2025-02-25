import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'import_details_widget_widget.dart' show ImportDetailsWidgetWidget;
import 'package:flutter/material.dart';

class ImportDetailsWidgetModel
    extends FlutterFlowModel<ImportDetailsWidgetWidget> {
  ///  Local state fields for this component.

  String? selectedMinute;

  String? selectedHour;

  String selectedDays = '';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getCronDescription)] action in ImportDetailsWidget widget.
  ApiCallResponse? apiResult6ic;
  // State field(s) for SchemaTypeDropDown widget.
  String? schemaTypeDropDownValue;
  FormFieldController<String>? schemaTypeDropDownValueController;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  // State field(s) for UrlTextField widget.
  FocusNode? urlTextFieldFocusNode;
  TextEditingController? urlTextFieldTextController;
  String? Function(BuildContext, String?)? urlTextFieldTextControllerValidator;
  // State field(s) for PostSelectionPromptTextField widget.
  FocusNode? postSelectionPromptTextFieldFocusNode;
  TextEditingController? postSelectionPromptTextFieldTextController;
  String? Function(BuildContext, String?)?
      postSelectionPromptTextFieldTextControllerValidator;
  // State field(s) for ImportCustomPromptTextField widget.
  FocusNode? importCustomPromptTextFieldFocusNode;
  TextEditingController? importCustomPromptTextFieldTextController;
  String? Function(BuildContext, String?)?
      importCustomPromptTextFieldTextControllerValidator;
  // State field(s) for ImportEnabledSwitch widget.
  bool? importEnabledSwitchValue;
  // Stores action output result for [Custom Action - show24hTimePicker] action in StartPickerBtn widget.
  String? timePicker;
  // Stores action output result for [Backend Call - API (getCronDescription)] action in StartPickerBtn widget.
  ApiCallResponse? cronDescriptionResult;
  // State field(s) for DayOfWeekCheckboxes widget.
  FormFieldController<List<String>>? dayOfWeekCheckboxesValueController;
  List<String>? get dayOfWeekCheckboxesValues =>
      dayOfWeekCheckboxesValueController?.value;
  set dayOfWeekCheckboxesValues(List<String>? v) =>
      dayOfWeekCheckboxesValueController?.value = v;

  // Stores action output result for [Backend Call - API (getCronDescription)] action in DayOfWeekCheckboxes widget.
  ApiCallResponse? cronDescriptionResult2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for CronExpressionField widget.
  FocusNode? cronExpressionFieldFocusNode;
  TextEditingController? cronExpressionFieldTextController;
  String? Function(BuildContext, String?)?
      cronExpressionFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (getCronDescription)] action in CronExpressionField widget.
  ApiCallResponse? cronDescriptionResult2Copy;
  // Stores action output result for [Backend Call - API (deleteImportSchema)] action in Button widget.
  ApiCallResponse? deleteCallResult;
  // Stores action output result for [Backend Call - API (createImportSchema)] action in Button widget.
  ApiCallResponse? schemaCreateResult;
  // Stores action output result for [Backend Call - API (updateImportSchema)] action in Button widget.
  ApiCallResponse? schemaUpdateResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    urlTextFieldFocusNode?.dispose();
    urlTextFieldTextController?.dispose();

    postSelectionPromptTextFieldFocusNode?.dispose();
    postSelectionPromptTextFieldTextController?.dispose();

    importCustomPromptTextFieldFocusNode?.dispose();
    importCustomPromptTextFieldTextController?.dispose();

    cronExpressionFieldFocusNode?.dispose();
    cronExpressionFieldTextController?.dispose();
  }
}
