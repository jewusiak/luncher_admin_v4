import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_user_page_widget.dart' show CreateUserPageWidget;
import 'package:flutter/material.dart';

class CreateUserPageModel extends FlutterFlowModel<CreateUserPageWidget> {
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
  // Stores action output result for [Backend Call - API (createUser)] action in Button widget.
  ApiCallResponse? createCallResult;

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
}
