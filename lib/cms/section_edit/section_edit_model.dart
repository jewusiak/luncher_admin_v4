import '/flutter_flow/flutter_flow_util.dart';
import 'section_edit_widget.dart' show SectionEditWidget;
import 'package:flutter/material.dart';

class SectionEditModel extends FlutterFlowModel<SectionEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for headerInput widget.
  FocusNode? headerInputFocusNode;
  TextEditingController? headerInputTextController;
  String? Function(BuildContext, String?)? headerInputTextControllerValidator;
  // State field(s) for subHeaderInput widget.
  FocusNode? subHeaderInputFocusNode;
  TextEditingController? subHeaderInputTextController;
  String? Function(BuildContext, String?)?
      subHeaderInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    headerInputFocusNode?.dispose();
    headerInputTextController?.dispose();

    subHeaderInputFocusNode?.dispose();
    subHeaderInputTextController?.dispose();
  }
}
