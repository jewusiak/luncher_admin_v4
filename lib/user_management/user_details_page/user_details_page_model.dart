import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'user_details_page_widget.dart' show UserDetailsPageWidget;
import 'package:flutter/material.dart';

class UserDetailsPageModel extends FlutterFlowModel<UserDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for firstnameInput widget.
  FocusNode? firstnameInputFocusNode;
  TextEditingController? firstnameInputTextController;
  String? Function(BuildContext, String?)?
      firstnameInputTextControllerValidator;
  // State field(s) for surnameInput widget.
  FocusNode? surnameInputFocusNode;
  TextEditingController? surnameInputTextController;
  String? Function(BuildContext, String?)? surnameInputTextControllerValidator;
  // State field(s) for emailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputTextController;
  String? Function(BuildContext, String?)? emailInputTextControllerValidator;
  // State field(s) for userRoleSelector widget.
  String? userRoleSelectorValue;
  FormFieldController<String>? userRoleSelectorValueController;
  // State field(s) for newPasswordInput widget.
  FocusNode? newPasswordInputFocusNode;
  TextEditingController? newPasswordInputTextController;
  late bool newPasswordInputVisibility;
  String? Function(BuildContext, String?)?
      newPasswordInputTextControllerValidator;
  // State field(s) for userEnabledCheckbox widget.
  bool? userEnabledCheckboxValue;
  // Stores action output result for [Backend Call - API (updateUser)] action in Button widget.
  ApiCallResponse? updateCallResult;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (deleteUser)] action in Button widget.
  ApiCallResponse? deleteResult;

  @override
  void initState(BuildContext context) {
    newPasswordInputVisibility = false;
  }

  @override
  void dispose() {
    firstnameInputFocusNode?.dispose();
    firstnameInputTextController?.dispose();

    surnameInputFocusNode?.dispose();
    surnameInputTextController?.dispose();

    emailInputFocusNode?.dispose();
    emailInputTextController?.dispose();

    newPasswordInputFocusNode?.dispose();
    newPasswordInputTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
