import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'section_element_edit_widget.dart' show SectionElementEditWidget;
import 'package:flutter/material.dart';

class SectionElementEditModel
    extends FlutterFlowModel<SectionElementEditWidget> {
  ///  Local state fields for this component.

  String placeSearchInfoText = 'Wpisz ID by znaleźć..';

  bool isIdValid = false;

  List<String> availablePlaceTypes = [];
  void addToAvailablePlaceTypes(String item) => availablePlaceTypes.add(item);
  void removeFromAvailablePlaceTypes(String item) =>
      availablePlaceTypes.remove(item);
  void removeAtIndexFromAvailablePlaceTypes(int index) =>
      availablePlaceTypes.removeAt(index);
  void insertAtIndexInAvailablePlaceTypes(int index, String item) =>
      availablePlaceTypes.insert(index, item);
  void updateAvailablePlaceTypesAtIndex(int index, Function(String) updateFn) =>
      availablePlaceTypes[index] = updateFn(availablePlaceTypes[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getAllPlaceTypes)] action in SectionElementEdit widget.
  ApiCallResponse? typesResults;
  // Stores action output result for [Backend Call - API (getById)] action in SectionElementEdit widget.
  ApiCallResponse? searchPlaceResult;
  // State field(s) for headerInput widget.
  FocusNode? headerInputFocusNode;
  TextEditingController? headerInputTextController;
  String? Function(BuildContext, String?)? headerInputTextControllerValidator;
  // State field(s) for subHeaderInput widget.
  FocusNode? subHeaderInputFocusNode;
  TextEditingController? subHeaderInputTextController;
  String? Function(BuildContext, String?)?
      subHeaderInputTextControllerValidator;
  // State field(s) for elementTypeSelector widget.
  String? elementTypeSelectorValue;
  FormFieldController<String>? elementTypeSelectorValueController;
  // State field(s) for PlaceTypeSelector widget.
  String? placeTypeSelectorValue;
  FormFieldController<String>? placeTypeSelectorValueController;
  // State field(s) for indentificatorInput widget.
  FocusNode? indentificatorInputFocusNode;
  TextEditingController? indentificatorInputTextController;
  String? Function(BuildContext, String?)?
      indentificatorInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (getById)] action in indentificatorInput widget.
  ApiCallResponse? searchPlaceResult2;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (uploadImage)] action in IconButton widget.
  ApiCallResponse? uploadApiCallResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    headerInputFocusNode?.dispose();
    headerInputTextController?.dispose();

    subHeaderInputFocusNode?.dispose();
    subHeaderInputTextController?.dispose();

    indentificatorInputFocusNode?.dispose();
    indentificatorInputTextController?.dispose();
  }
}
