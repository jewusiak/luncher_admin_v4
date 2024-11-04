import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'place_menu_offer_edit_widget.dart' show PlaceMenuOfferEditWidget;
import 'package:flutter/material.dart';

class PlaceMenuOfferEditModel
    extends FlutterFlowModel<PlaceMenuOfferEditWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    basePriceInputFocusNode?.dispose();
    basePriceInputTextController?.dispose();
  }
}
