import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'page_arrangement_details_widget.dart' show PageArrangementDetailsWidget;
import 'package:flutter/material.dart';

class PageArrangementDetailsModel
    extends FlutterFlowModel<PageArrangementDetailsWidget> {
  ///  Local state fields for this page.

  PageArrangementDtoStruct? arrangement;
  void updateArrangementStruct(Function(PageArrangementDtoStruct) updateFn) {
    updateFn(arrangement ??= PageArrangementDtoStruct());
  }

  bool shouldBuild = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getArrangementById)] action in PageArrangementDetails widget.
  ApiCallResponse? getArrangementResult;
  // Stores action output result for [Backend Call - API (updateArrangement)] action in SaveButton widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (makeArrangementPrimary)] action in Button widget.
  ApiCallResponse? apiResultxmv;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
