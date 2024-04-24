import '/flutter_flow/flutter_flow_util.dart';
import 'users_list_page_widget.dart' show UsersListPageWidget;
import 'package:flutter/material.dart';

class UsersListPageModel extends FlutterFlowModel<UsersListPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
