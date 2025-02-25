import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'dart:async';
import 'places_list_page_widget.dart' show PlacesListPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PlacesListPageModel extends FlutterFlowModel<PlacesListPageWidget> {
  ///  Local state fields for this page.

  List<UserStruct> owners = [];
  void addToOwners(UserStruct item) => owners.add(item);
  void removeFromOwners(UserStruct item) => owners.remove(item);
  void removeAtIndexFromOwners(int index) => owners.removeAt(index);
  void insertAtIndexInOwners(int index, UserStruct item) =>
      owners.insert(index, item);
  void updateOwnersAtIndex(int index, Function(UserStruct) updateFn) =>
      owners[index] = updateFn(owners[index]);

  bool deletingEnabled = false;

  List<String> removedPlaceIds = [];
  void addToRemovedPlaceIds(String item) => removedPlaceIds.add(item);
  void removeFromRemovedPlaceIds(String item) => removedPlaceIds.remove(item);
  void removeAtIndexFromRemovedPlaceIds(int index) =>
      removedPlaceIds.removeAt(index);
  void insertAtIndexInRemovedPlaceIds(int index, String item) =>
      removedPlaceIds.insert(index, item);
  void updateRemovedPlaceIdsAtIndex(int index, Function(String) updateFn) =>
      removedPlaceIds[index] = updateFn(removedPlaceIds[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // State field(s) for PlaceTypeSelector widget.
  String? placeTypeSelectorValue;
  FormFieldController<String>? placeTypeSelectorValueController;
  // State field(s) for PlaceEnabledSelector widget.
  String? placeEnabledSelectorValue;
  FormFieldController<String>? placeEnabledSelectorValueController;
  // State field(s) for OwnerTextField widget.
  final ownerTextFieldKey = GlobalKey();
  FocusNode? ownerTextFieldFocusNode;
  TextEditingController? ownerTextFieldTextController;
  String? ownerTextFieldSelectedOption;
  String? Function(BuildContext, String?)?
      ownerTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (adminSearchUsers)] action in OwnerTextField widget.
  ApiCallResponse? ownersSearchResult;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // Stores action output result for [Backend Call - API (removePlace)] action in IconButton widget.
  ApiCallResponse? deleteQuery;

  /// Query cache managers for this widget.

  final _placeTypeQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> placeTypeQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _placeTypeQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPlaceTypeQueryCache() => _placeTypeQueryManager.clear();
  void clearPlaceTypeQueryCacheKey(String? uniqueKey) =>
      _placeTypeQueryManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    ownerTextFieldFocusNode?.dispose();

    listViewPagingController?.dispose();

    /// Dispose query cache managers for this widget.

    clearPlaceTypeQueryCache();
  }

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewSearchQueryPage);
  }

  void listViewSearchQueryPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewSearchQueryResponse) {
        final pageItems = ((listViewSearchQueryResponse.jsonBody
                        .toList()
                        .map<PlaceDtoStruct?>(PlaceDtoStruct.maybeFromMap)
                        .toList() as Iterable<PlaceDtoStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewSearchQueryResponse,
                )
              : null,
        );
      });
}
