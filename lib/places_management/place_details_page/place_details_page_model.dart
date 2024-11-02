import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import 'place_details_page_widget.dart' show PlaceDetailsPageWidget;
import 'package:flutter/material.dart';

class PlaceDetailsPageModel extends FlutterFlowModel<PlaceDetailsPageWidget> {
  ///  Local state fields for this page.

  bool shouldBuild = false;

  PlaceDtoStruct? place;
  void updatePlaceStruct(Function(PlaceDtoStruct) updateFn) {
    updateFn(place ??= PlaceDtoStruct());
  }

  bool buildOpeningHrs = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getById)] action in PlaceDetailsPage widget.
  ApiCallResponse? getPlaceResult;
  // Stores action output result for [Backend Call - API (updatePlace)] action in SaveButton widget.
  ApiCallResponse? saveResult;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for NameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for LongNameInput widget.
  FocusNode? longNameInputFocusNode;
  TextEditingController? longNameInputTextController;
  String? Function(BuildContext, String?)? longNameInputTextControllerValidator;
  // State field(s) for PlaceTypeSelector widget.
  String? placeTypeSelectorValue;
  FormFieldController<String>? placeTypeSelectorValueController;
  // State field(s) for PlaceDescriptionInput widget.
  FocusNode? placeDescriptionInputFocusNode;
  TextEditingController? placeDescriptionInputTextController;
  String? Function(BuildContext, String?)?
      placeDescriptionInputTextControllerValidator;
  // State field(s) for PlaceEnabledSwitch widget.
  bool? placeEnabledSwitchValue;
  // Stores action output result for [Backend Call - API (TextSearch)] action in Button widget.
  ApiCallResponse? googleMapsApiCallResult;
  // State field(s) for address1stLine widget.
  FocusNode? address1stLineFocusNode;
  TextEditingController? address1stLineTextController;
  String? Function(BuildContext, String?)?
      address1stLineTextControllerValidator;
  // State field(s) for address2ndLine widget.
  FocusNode? address2ndLineFocusNode;
  TextEditingController? address2ndLineTextController;
  String? Function(BuildContext, String?)?
      address2ndLineTextControllerValidator;
  // State field(s) for addressZipCode widget.
  FocusNode? addressZipCodeFocusNode;
  TextEditingController? addressZipCodeTextController;
  String? Function(BuildContext, String?)?
      addressZipCodeTextControllerValidator;
  // State field(s) for addressCity widget.
  FocusNode? addressCityFocusNode;
  TextEditingController? addressCityTextController;
  String? Function(BuildContext, String?)? addressCityTextControllerValidator;
  // State field(s) for addressDistrict widget.
  FocusNode? addressDistrictFocusNode;
  TextEditingController? addressDistrictTextController;
  String? Function(BuildContext, String?)?
      addressDistrictTextControllerValidator;
  // State field(s) for addressCountry widget.
  FocusNode? addressCountryFocusNode;
  TextEditingController? addressCountryTextController;
  String? Function(BuildContext, String?)?
      addressCountryTextControllerValidator;
  // State field(s) for location_lat widget.
  FocusNode? locationLatFocusNode;
  TextEditingController? locationLatTextController;
  String? Function(BuildContext, String?)? locationLatTextControllerValidator;
  // State field(s) for location_lon widget.
  FocusNode? locationLonFocusNode;
  TextEditingController? locationLonTextController;
  String? Function(BuildContext, String?)? locationLonTextControllerValidator;
  // State field(s) for GooglePlaceIdInput widget.
  FocusNode? googlePlaceIdInputFocusNode;
  TextEditingController? googlePlaceIdInputTextController;
  String? Function(BuildContext, String?)?
      googlePlaceIdInputTextControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Query cache managers for this widget.

  final _getPlaceTypesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getPlaceTypes({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getPlaceTypesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetPlaceTypesCache() => _getPlaceTypesManager.clear();
  void clearGetPlaceTypesCacheKey(String? uniqueKey) =>
      _getPlaceTypesManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    longNameInputFocusNode?.dispose();
    longNameInputTextController?.dispose();

    placeDescriptionInputFocusNode?.dispose();
    placeDescriptionInputTextController?.dispose();

    address1stLineFocusNode?.dispose();
    address1stLineTextController?.dispose();

    address2ndLineFocusNode?.dispose();
    address2ndLineTextController?.dispose();

    addressZipCodeFocusNode?.dispose();
    addressZipCodeTextController?.dispose();

    addressCityFocusNode?.dispose();
    addressCityTextController?.dispose();

    addressDistrictFocusNode?.dispose();
    addressDistrictTextController?.dispose();

    addressCountryFocusNode?.dispose();
    addressCountryTextController?.dispose();

    locationLatFocusNode?.dispose();
    locationLatTextController?.dispose();

    locationLonFocusNode?.dispose();
    locationLonTextController?.dispose();

    googlePlaceIdInputFocusNode?.dispose();
    googlePlaceIdInputTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearGetPlaceTypesCache();
  }
}
