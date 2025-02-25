import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'users_list_page_widget.dart' show UsersListPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UsersListPageModel extends FlutterFlowModel<UsersListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // State field(s) for UsersListView widget.

  PagingController<ApiPagingParams, dynamic>? usersListViewPagingController;
  Function(ApiPagingParams nextPageMarker)? usersListViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    usersListViewPagingController?.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForUsersListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (usersListViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setUsersListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    usersListViewApiCall = apiCall;
    return usersListViewPagingController ??=
        _createUsersListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createUsersListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(usersListViewAdminSearchUsersPage);
  }

  void usersListViewAdminSearchUsersPage(ApiPagingParams nextPageMarker) =>
      usersListViewApiCall!(nextPageMarker)
          .then((usersListViewAdminSearchUsersResponse) {
        final pageItems = ((usersListViewAdminSearchUsersResponse.jsonBody
                        .toList()
                        .map<UserStruct?>(UserStruct.maybeFromMap)
                        .toList() as Iterable<UserStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        usersListViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: usersListViewAdminSearchUsersResponse,
                )
              : null,
        );
      });
}
