import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'place_type_details_dialog_widget.dart'
    show PlaceTypeDetailsDialogWidget;
import 'package:flutter/material.dart';

class PlaceTypeDetailsDialogModel
    extends FlutterFlowModel<PlaceTypeDetailsDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for identifierInput widget.
  FocusNode? identifierInputFocusNode;
  TextEditingController? identifierInputTextController;
  String? Function(BuildContext, String?)?
      identifierInputTextControllerValidator;
  // State field(s) for iconNameInput widget.
  FocusNode? iconNameInputFocusNode;
  TextEditingController? iconNameInputTextController;
  String? Function(BuildContext, String?)? iconNameInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (createPlaceType)] action in Button widget.
  ApiCallResponse? createResult;
  // Stores action output result for [Backend Call - API (updatePlaceType)] action in Button widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (deletePlaceType)] action in Button widget.
  ApiCallResponse? deleteResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    identifierInputFocusNode?.dispose();
    identifierInputTextController?.dispose();

    iconNameInputFocusNode?.dispose();
    iconNameInputTextController?.dispose();
  }
}
