import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'option_edit_widget.dart' show OptionEditWidget;
import 'package:flutter/material.dart';

class OptionEditModel extends FlutterFlowModel<OptionEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for basePriceInput widget.
  FocusNode? basePriceInputFocusNode;
  TextEditingController? basePriceInputTextController;
  String? Function(BuildContext, String?)?
      basePriceInputTextControllerValidator;
  // State field(s) for CcyDropDown widget.
  String? ccyDropDownValue;
  FormFieldController<String>? ccyDropDownValueController;
  // State field(s) for descriptionInput widget.
  FocusNode? descriptionInputFocusNode;
  TextEditingController? descriptionInputTextController;
  String? Function(BuildContext, String?)?
      descriptionInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    basePriceInputFocusNode?.dispose();
    basePriceInputTextController?.dispose();

    descriptionInputFocusNode?.dispose();
    descriptionInputTextController?.dispose();
  }
}
