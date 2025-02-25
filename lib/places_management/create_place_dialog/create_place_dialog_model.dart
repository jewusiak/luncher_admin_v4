import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_place_dialog_widget.dart' show CreatePlaceDialogWidget;
import 'package:flutter/material.dart';

class CreatePlaceDialogModel extends FlutterFlowModel<CreatePlaceDialogWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  String? _nameInputTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Wypełnij nazwę';
    }

    if (val.length < 1) {
      return 'Wypełnij nazwę';
    }

    return null;
  }

  // State field(s) for PlaceTypeSelector widget.
  String? placeTypeSelectorValue;
  FormFieldController<String>? placeTypeSelectorValueController;
  // Stores action output result for [Backend Call - API (createPlace)] action in Button widget.
  ApiCallResponse? createResult;

  @override
  void initState(BuildContext context) {
    nameInputTextControllerValidator = _nameInputTextControllerValidator;
  }

  @override
  void dispose() {
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();
  }
}
