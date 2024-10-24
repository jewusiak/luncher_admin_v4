import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'places_list_page_widget.dart' show PlacesListPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PlacesListPageModel extends FlutterFlowModel<PlacesListPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // State field(s) for PlaceTypeSelector widget.
  String? placeTypeSelectorValue;
  FormFieldController<String>? placeTypeSelectorValueController;
  // State field(s) for PlacesListView widget.

  PagingController<ApiPagingParams, dynamic>? placesListViewPagingController;
  Function(ApiPagingParams nextPageMarker)? placesListViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    placesListViewPagingController?.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForPlacesListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (placesListViewPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setPlacesListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    placesListViewApiCall = apiCall;
    return placesListViewPagingController ??=
        _createPlacesListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createPlacesListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(placesListViewSearchQueryPage);
  }

  void placesListViewSearchQueryPage(ApiPagingParams nextPageMarker) =>
      placesListViewApiCall!(nextPageMarker)
          .then((placesListViewSearchQueryResponse) {
        final pageItems = ((placesListViewSearchQueryResponse.jsonBody
                        .toList()
                        .map<PlaceFullResponseStruct?>(
                            PlaceFullResponseStruct.maybeFromMap)
                        .toList() as Iterable<PlaceFullResponseStruct?>)
                    .withoutNulls ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        placesListViewPagingController?.appendPage(
          pageItems,
          (pageItems.isNotEmpty)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: placesListViewSearchQueryResponse,
                )
              : null,
        );
      });
}
