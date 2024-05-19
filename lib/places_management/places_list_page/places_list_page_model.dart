import '/flutter_flow/flutter_flow_util.dart';
import 'places_list_page_widget.dart' show PlacesListPageWidget;
import 'package:flutter/material.dart';

class PlacesListPageModel extends FlutterFlowModel<PlacesListPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
