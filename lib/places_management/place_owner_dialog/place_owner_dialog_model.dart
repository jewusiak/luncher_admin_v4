import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_owner_dialog_widget.dart' show PlaceOwnerDialogWidget;
import 'package:flutter/material.dart';

class PlaceOwnerDialogModel extends FlutterFlowModel<PlaceOwnerDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailInput widget.
  final emailInputKey = GlobalKey();
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputTextController;
  String? emailInputSelectedOption;
  String? Function(BuildContext, String?)? emailInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (updatePlacesOwner)] action in Button widget.
  ApiCallResponse? updateResult2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailInputFocusNode?.dispose();
  }
}
