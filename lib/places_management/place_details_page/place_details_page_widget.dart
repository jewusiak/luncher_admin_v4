import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/places_management/imports/import_details_widget/import_details_widget_widget.dart';
import '/places_management/menus/menu_offer_edit/menu_offer_edit_widget.dart';
import '/places_management/select_google_places_api_address/select_google_places_api_address_widget.dart';
import '/places_management/week_day_time_range_edit/week_day_time_range_edit_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'place_details_page_model.dart';
export 'place_details_page_model.dart';

class PlaceDetailsPageWidget extends StatefulWidget {
  const PlaceDetailsPageWidget({
    super.key,
    required this.placeId,
    int? selectedPage,
  }) : this.selectedPage = selectedPage ?? 0;

  final String? placeId;
  final int selectedPage;

  static String routeName = 'PlaceDetailsPage';
  static String routePath = 'placeDetails';

  @override
  State<PlaceDetailsPageWidget> createState() => _PlaceDetailsPageWidgetState();
}

class _PlaceDetailsPageWidgetState extends State<PlaceDetailsPageWidget>
    with TickerProviderStateMixin {
  late PlaceDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceDetailsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getPlaceResult =
          await LuncherCoreAPIGETPlaceUuidGroup.getByIdCall.call(
        uuid: widget.placeId,
        authorization: currentAuthenticationToken,
      );

      if ((_model.getPlaceResult?.succeeded ?? true)) {
        _model.shouldBuild = true;
        safeSetState(() {});
        _model.place = PlaceDtoStruct.maybeFromMap(
            (_model.getPlaceResult?.jsonBody ?? ''));
        safeSetState(() {
          _model.nameInputTextController?.text = _model.place!.name;
        });
        safeSetState(() {
          _model.longNameInputTextController?.text = _model.place!.longName;
        });
        safeSetState(() {
          _model.placeDescriptionInputTextController?.text =
              _model.place!.description;
        });
        safeSetState(() {
          _model.placeEnabledSwitchValue = _model.place!.enabled;
        });
        safeSetState(() {
          _model.placeTypeSelectorValueController?.value =
              _model.place!.placeType.identifier;
        });
        safeSetState(() {
          _model.address1stLineTextController?.text =
              _model.place!.address.firstLine;
        });
        safeSetState(() {
          _model.address2ndLineTextController?.text =
              _model.place!.address.secondLine;
        });
        safeSetState(() {
          _model.addressZipCodeTextController?.text =
              _model.place!.address.zipCode;
        });
        safeSetState(() {
          _model.addressCityTextController?.text = _model.place!.address.city;
        });
        safeSetState(() {
          _model.addressDistrictTextController?.text =
              _model.place!.address.district;
        });
        safeSetState(() {
          _model.addressCountryTextController?.text =
              _model.place!.address.country;
        });
        safeSetState(() {
          _model.locationLatTextController?.text =
              _model.place!.location.latitude.toString();
        });
        safeSetState(() {
          _model.locationLonTextController?.text =
              _model.place!.location.longitude.toString();
        });
        safeSetState(() {
          _model.googlePlaceIdInputTextController?.text =
              _model.place!.googleMapsReference;
        });
        safeSetState(() {
          _model.websiteUrlTextController?.text = _model.place!.instagramHandle;
        });
        safeSetState(() {
          _model.facebookPageIdTextController?.text =
              _model.place!.facebookPageId;
        });
        safeSetState(() {
          _model.phoneNumberTextController?.text = _model.place!.phoneNumber;
        });
        safeSetState(() {
          _model.websiteUrlTextController?.text = _model.place!.webpageUrl;
        });
        safeSetState(() {
          _model.instagramHandleTextController?.text =
              _model.place!.instagramHandle;
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Błąd'),
              content: Text('Nie udało się pobrać danych o lokalu!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 7,
      initialIndex: min(
          valueOrDefault<int>(
            widget.selectedPage,
            0,
          ),
          6),
    )..addListener(() => safeSetState(() {}));
    _model.nameInputTextController ??= TextEditingController();
    _model.nameInputFocusNode ??= FocusNode();

    _model.longNameInputTextController ??= TextEditingController();
    _model.longNameInputFocusNode ??= FocusNode();

    _model.placeDescriptionInputTextController ??= TextEditingController();
    _model.placeDescriptionInputFocusNode ??= FocusNode();

    _model.placeEnabledSwitchValue = true;
    _model.address1stLineTextController ??= TextEditingController();
    _model.address1stLineFocusNode ??= FocusNode();

    _model.address2ndLineTextController ??= TextEditingController();
    _model.address2ndLineFocusNode ??= FocusNode();

    _model.addressZipCodeTextController ??= TextEditingController();
    _model.addressZipCodeFocusNode ??= FocusNode();

    _model.addressCityTextController ??= TextEditingController();
    _model.addressCityFocusNode ??= FocusNode();

    _model.addressDistrictTextController ??= TextEditingController();
    _model.addressDistrictFocusNode ??= FocusNode();

    _model.addressCountryTextController ??= TextEditingController();
    _model.addressCountryFocusNode ??= FocusNode();

    _model.locationLatTextController ??= TextEditingController();
    _model.locationLatFocusNode ??= FocusNode();

    _model.locationLonTextController ??= TextEditingController();
    _model.locationLonFocusNode ??= FocusNode();

    _model.googlePlaceIdInputTextController ??= TextEditingController();
    _model.googlePlaceIdInputFocusNode ??= FocusNode();

    _model.facebookPageIdTextController ??= TextEditingController();
    _model.facebookPageIdFocusNode ??= FocusNode();

    _model.instagramHandleTextController ??= TextEditingController();
    _model.instagramHandleFocusNode ??= FocusNode();

    _model.websiteUrlTextController ??= TextEditingController();
    _model.websiteUrlFocusNode ??= FocusNode();

    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 55.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Szczegóły lokalu',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.save,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                showLoadingIndicator: true,
                onPressed: () async {
                  _model.saveResult = await LuncherCoreAPIPUTPlacePlaceUuidGroup
                      .updatePlaceCall
                      .call(
                    authorization: currentAuthenticationToken,
                    placeUuid: widget.placeId,
                    name: _model.nameInputTextController.text,
                    longName: _model.longNameInputTextController.text,
                    description:
                        _model.placeDescriptionInputTextController.text,
                    addressFirstLine: _model.address1stLineTextController.text,
                    addressSecondLine: _model.address2ndLineTextController.text,
                    addressCity: _model.addressCityTextController.text,
                    addressZipCode: _model.addressZipCodeTextController.text,
                    addressCountry: _model.addressCountryTextController.text,
                    addressDistrict: _model.addressDistrictTextController.text,
                    enabled: _model.placeEnabledSwitchValue?.toString(),
                    placeTypeIdentifier: _model.placeTypeSelectorValue,
                    openingWindowsJson: _model.place?.openingWindows
                        .map((e) => e.toMap())
                        .toList(),
                    googleMapsReference:
                        _model.googlePlaceIdInputTextController.text,
                    locationLatitude:
                        double.tryParse(_model.locationLatTextController.text),
                    locationLongitude:
                        double.tryParse(_model.locationLonTextController.text),
                    menuOffersJson: _model.place?.menuOffers
                        .map((e) => e.toMap())
                        .toList(),
                    imageIdsList:
                        _model.place?.images.map((e) => e.id).toList(),
                    facebookPageId: _model.facebookPageIdTextController.text,
                    instagramHandle: _model.instagramHandleTextController.text,
                    webpageUrl: _model.websiteUrlTextController.text,
                    phoneNumber: _model.phoneNumberTextController.text,
                    timeZone: valueOrDefault<String>(
                      _model.timeZoneDropDownValue,
                      'd6f35f82-da54-4473-b7a0-ab7b59cbafe7',
                    ),
                  );

                  if ((_model.saveResult?.succeeded ?? true)) {
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed(
                      PlaceDetailsPageWidget.routeName,
                      queryParameters: {
                        'placeId': serializeParam(
                          widget.placeId,
                          ParamType.String,
                        ),
                        'selectedPage': serializeParam(
                          _model.tabBarCurrentIndex,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Pomyślnie zapisano dane o lokalu!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 1000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Błąd w zapisie lokalu (${ErrorDtoStruct.maybeFromMap((_model.saveResult?.jsonBody ?? ''))?.message})',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }

                  safeSetState(() {});
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (_model.shouldBuild) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                        unselectedLabelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        tabs: [
                          Tab(
                            text: 'Podstawowe dane',
                          ),
                          Tab(
                            text: 'Godziny otwarcia',
                          ),
                          Tab(
                            text: 'Zdjęcia',
                          ),
                          Tab(
                            text: 'Oferty menu',
                          ),
                          Tab(
                            text: 'Automatyzacja',
                          ),
                          Tab(
                            text: 'Lokalizacja',
                          ),
                          Tab(
                            text: 'Social Media',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {},
                            () async {}
                          ][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          KeepAliveWidgetWrapper(
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 350.0,
                                      child: TextFormField(
                                        controller:
                                            _model.nameInputTextController,
                                        focusNode: _model.nameInputFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Nazwa lokalu',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          alignLabelWithHint: true,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .nameInputTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Container(
                                      width: 350.0,
                                      child: TextFormField(
                                        controller:
                                            _model.longNameInputTextController,
                                        focusNode:
                                            _model.longNameInputFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Długa nazwa lokalu',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          alignLabelWithHint: true,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .longNameInputTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    FutureBuilder<ApiCallResponse>(
                                      future: _model.getPlaceTypes(
                                        requestFn: () =>
                                            LuncherCoreAPIGETPlacetypeGroup
                                                .getAllPlaceTypesCall
                                                .call(
                                          authorization:
                                              currentAuthenticationToken,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final placeTypeSelectorGetAllPlaceTypesResponse =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .placeTypeSelectorValueController ??=
                                              FormFieldController<String>(
                                            _model.placeTypeSelectorValue ??=
                                                _model.place?.placeType
                                                    .identifier,
                                          ),
                                          options: List<String>.from(
                                              (placeTypeSelectorGetAllPlaceTypesResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<PlaceTypeStruct?>(
                                                              PlaceTypeStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          PlaceTypeStruct?>)
                                                  .withoutNulls
                                                  .map((e) => e.identifier)
                                                  .toList()),
                                          optionLabels:
                                              (placeTypeSelectorGetAllPlaceTypesResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<PlaceTypeStruct?>(
                                                              PlaceTypeStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          PlaceTypeStruct?>)
                                                  .withoutNulls
                                                  .map((e) => e.name)
                                                  .toList(),
                                          onChanged: (val) => safeSetState(() =>
                                              _model.placeTypeSelectorValue =
                                                  val),
                                          width: 200.0,
                                          height: 40.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Rodzaj lokalu',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                    Container(
                                      width: 550.0,
                                      child: TextFormField(
                                        controller: _model
                                            .placeDescriptionInputTextController,
                                        focusNode: _model
                                            .placeDescriptionInputFocusNode,
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Opis lokalu',
                                          alignLabelWithHint: true,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLines: null,
                                        minLines: 5,
                                        keyboardType: TextInputType.multiline,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .placeDescriptionInputTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Włączone?',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Switch.adaptive(
                                          value:
                                              _model.placeEnabledSwitchValue!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.placeEnabledSwitchValue =
                                                    newValue);
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    Text(
                                      'Place ID: ${widget.placeId}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 15.0)),
                                ),
                              ],
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.info_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              'Podwójne kliknięcie na termin pozwala na zduplikowanie elementu.',
                                              maxLines: 4,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Builder(
                                          builder: (context) =>
                                              FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 45.0,
                                            borderWidth: 1.0,
                                            buttonSize: 45.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            icon: Icon(
                                              Icons.add,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              FFAppState()
                                                      .editedWeekDayTimeRange =
                                                  WeekDayTimeRangeStruct(
                                                startTime: WeekDayTimeStruct(
                                                  time: '12:00',
                                                  day: 'MONDAY',
                                                ),
                                                endTime: WeekDayTimeStruct(
                                                  time: '15:00',
                                                  day: 'MONDAY',
                                                ),
                                              );
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          WeekDayTimeRangeEditWidget(
                                                        isNew: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              if (FFAppState()
                                                      .editedWeekDayTimeRangeAction ==
                                                  ActionType.CREATE) {
                                                // Add new range
                                                _model.updatePlaceStruct(
                                                  (e) => e
                                                    ..updateOpeningWindows(
                                                      (e) => e.add(FFAppState()
                                                          .editedWeekDayTimeRange),
                                                    ),
                                                );
                                                safeSetState(() {});
                                              }
                                              // Clear helper vars
                                              FFAppState()
                                                      .editedWeekDayTimeRange =
                                                  WeekDayTimeRangeStruct();
                                              FFAppState()
                                                      .editedWeekDayTimeRangeAction =
                                                  null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 700.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final openingWindows = _model
                                                  .place?.openingWindows
                                                  .toList() ??
                                              [];

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: openingWindows.length,
                                            itemBuilder:
                                                (context, openingWindowsIndex) {
                                              final openingWindowsItem =
                                                  openingWindows[
                                                      openingWindowsIndex];
                                              return Visibility(
                                                visible: openingWindowsItem
                                                            .startTime.time !=
                                                        '',
                                                child: Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                              .editedWeekDayTimeRange =
                                                          WeekDayTimeRangeStruct(
                                                        startTime:
                                                            WeekDayTimeStruct(
                                                          time:
                                                              openingWindowsItem
                                                                  .startTime
                                                                  .time,
                                                          day:
                                                              openingWindowsItem
                                                                  .startTime
                                                                  .day,
                                                        ),
                                                        endTime:
                                                            WeekDayTimeStruct(
                                                          time:
                                                              openingWindowsItem
                                                                  .endTime.time,
                                                          day:
                                                              openingWindowsItem
                                                                  .endTime.day,
                                                        ),
                                                      );
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child:
                                                                  WeekDayTimeRangeEditWidget(),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      if (FFAppState()
                                                              .editedWeekDayTimeRangeAction ==
                                                          ActionType.UPDATE) {
                                                        // Update selected range
                                                        _model
                                                            .updatePlaceStruct(
                                                          (e) => e
                                                            ..updateOpeningWindows(
                                                              (e) => e[
                                                                      openingWindowsIndex] =
                                                                  FFAppState()
                                                                      .editedWeekDayTimeRange,
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                      } else if (FFAppState()
                                                              .editedWeekDayTimeRangeAction ==
                                                          ActionType.DELETE) {
                                                        // Delete selected range
                                                        _model
                                                            .updatePlaceStruct(
                                                          (e) => e
                                                            ..updateOpeningWindows(
                                                              (e) => e.remove(
                                                                  openingWindowsItem),
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                      } else if (FFAppState()
                                                              .editedWeekDayTimeRangeAction ==
                                                          ActionType.CREATE) {
                                                        // Add new range
                                                        _model
                                                            .updatePlaceStruct(
                                                          (e) => e
                                                            ..updateOpeningWindows(
                                                              (e) => e.add(
                                                                  FFAppState()
                                                                      .editedWeekDayTimeRange),
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                      }

                                                      // Clear helper vars
                                                      FFAppState()
                                                              .editedWeekDayTimeRange =
                                                          WeekDayTimeRangeStruct();
                                                      FFAppState()
                                                              .editedWeekDayTimeRangeAction =
                                                          null;
                                                    },
                                                    onDoubleTap: () async {
                                                      FFAppState()
                                                              .editedWeekDayTimeRange =
                                                          functions
                                                              .cloneWeekDayTimeRange(
                                                                  openingWindowsItem)!;
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child:
                                                                  WeekDayTimeRangeEditWidget(
                                                                isNew: true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      if (FFAppState()
                                                              .editedWeekDayTimeRangeAction ==
                                                          ActionType.CREATE) {
                                                        // Add new range
                                                        _model
                                                            .updatePlaceStruct(
                                                          (e) => e
                                                            ..updateOpeningWindows(
                                                              (e) => e.add(
                                                                  FFAppState()
                                                                      .editedWeekDayTimeRange),
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                      }
                                                      // Clear helper vars
                                                      FFAppState()
                                                              .editedWeekDayTimeRange =
                                                          WeekDayTimeRangeStruct();
                                                      FFAppState()
                                                              .editedWeekDayTimeRangeAction =
                                                          null;
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: ListTile(
                                                        title: Text(
                                                          '${functions.dayOfWeekEnumToPolishName(openingWindowsItem.startTime.day)}, ${openingWindowsItem.startTime.time} - ${openingWindowsItem.startTime.day == openingWindowsItem.endTime.day ? '' : '${functions.dayOfWeekEnumToPolishName(openingWindowsItem.endTime.day)}, '}${openingWindowsItem.endTime.time}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        trailing: Icon(
                                                          Icons
                                                              .arrow_forward_ios_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        dense: false,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMedia(
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              safeSetState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFiles =
                                                      selectedUploadedFiles;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }

                                            _model.iter = 0;
                                            _model.maxIter = _model
                                                .uploadedLocalFiles.length;
                                            while (_model.iter <
                                                _model.uploadedLocalFiles
                                                    .length) {
                                              _model.uploadFile =
                                                  await LuncherCoreAPIPOSTAssetGroup
                                                      .uploadImageCall
                                                      .call(
                                                authorization:
                                                    currentAuthenticationToken,
                                                file: _model.uploadedLocalFiles
                                                    .elementAtOrNull(
                                                        _model.iter),
                                              );

                                              _model.iter = _model.iter + 1;
                                              _model.updatePlaceStruct(
                                                (e) => e
                                                  ..updateImages(
                                                    (e) => e.add(AssetStruct
                                                        .maybeFromMap((_model
                                                                .uploadFile
                                                                ?.jsonBody ??
                                                            ''))!),
                                                  ),
                                              );
                                              safeSetState(() {});
                                            }
                                            _model.iter = 0;
                                            _model.maxIter = 0;
                                            safeSetState(() {});

                                            safeSetState(() {});
                                          },
                                          text: 'Dodaj nowe zdjęcie',
                                          icon: Icon(
                                            Icons.upload_sharp,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        if (_model.maxIter != 0)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: CircularPercentIndicator(
                                              percent: functions.divideDoubles(
                                                  _model.iter.toDouble(),
                                                  _model.maxIter.toDouble())!,
                                              radius: 25.0,
                                              lineWidth: 5.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              center: Text(
                                                '${_model.iter.toString()}/${_model.maxIter.toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 700.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final imageIdsIter =
                                            _model.place?.images.toList() ??
                                                [];

                                        return ReorderableListView.builder(
                                          padding: EdgeInsets.zero,
                                          proxyDecorator: (Widget child,
                                                  int index,
                                                  Animation<double>
                                                      animation) =>
                                              Material(
                                                  color: Colors.transparent,
                                                  child: child),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: imageIdsIter.length,
                                          itemBuilder:
                                              (context, imageIdsIterIndex) {
                                            final imageIdsIterItem =
                                                imageIdsIter[imageIdsIterIndex];
                                            return Container(
                                              key: ValueKey(
                                                  "ListView_0xzog8f3" +
                                                      '_' +
                                                      imageIdsIterIndex
                                                          .toString()),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: Container(
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      5.0,
                                                                      10.0,
                                                                      5.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              child: OctoImage(
                                                                placeholderBuilder:
                                                                    (_) => SizedBox
                                                                        .expand(
                                                                  child: Image(
                                                                    image: BlurHashImage(
                                                                        imageIdsIterItem
                                                                            .blurHash),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  imageIdsIterItem
                                                                      .accessUrl,
                                                                ),
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 150.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    60.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 8.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                          icon: Icon(
                                                            Icons.delete_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model
                                                                .updatePlaceStruct(
                                                              (e) => e
                                                                ..updateImages(
                                                                  (e) => e.removeAt(
                                                                      imageIdsIterIndex),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          onReorder: (int reorderableOldIndex,
                                              int reorderableNewIndex) async {
                                            // A1
                                            _model.updatePlaceStruct(
                                              (e) => e
                                                ..images = functions
                                                    .swapItemsOfAssetsList(
                                                        _model.place?.images
                                                            .toList(),
                                                        reorderableOldIndex,
                                                        reorderableNewIndex)!
                                                    .toList(),
                                            );

                                            safeSetState(() {});
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 700.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final menuOffers = _model
                                                .place?.menuOffers
                                                .toList() ??
                                            [];

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: menuOffers.length,
                                          itemBuilder:
                                              (context, menuOffersIndex) {
                                            final menuOffersItem =
                                                menuOffers[menuOffersIndex];
                                            return Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().editedMenuOffer =
                                                      functions
                                                          .cloneMenuOfferObject(
                                                              menuOffersItem)!;
                                                  FFAppState()
                                                          .editedMenuOfferAction =
                                                      null;
                                                  safeSetState(() {});
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              MenuOfferEditWidget(
                                                            isNew: false,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (FFAppState()
                                                          .editedMenuOfferAction ==
                                                      ActionType.UPDATE) {
                                                    // Update selected range
                                                    _model.updatePlaceStruct(
                                                      (e) => e
                                                        ..updateMenuOffers(
                                                          (e) => e[
                                                                  menuOffersIndex] =
                                                              FFAppState()
                                                                  .editedMenuOffer,
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                  } else if (FFAppState()
                                                          .editedMenuOfferAction ==
                                                      ActionType.DELETE) {
                                                    // Update selected range
                                                    _model.updatePlaceStruct(
                                                      (e) => e
                                                        ..updateMenuOffers(
                                                          (e) => e.removeAt(
                                                              menuOffersIndex),
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                  } else if (FFAppState()
                                                          .editedMenuOfferAction ==
                                                      ActionType.CREATE) {
                                                    // Update selected range
                                                    _model.updatePlaceStruct(
                                                      (e) => e
                                                        ..updateMenuOffers(
                                                          (e) => e.add(FFAppState()
                                                              .editedMenuOffer),
                                                        ),
                                                    );
                                                    safeSetState(() {});
                                                  }

                                                  // Clear helper vars
                                                  FFAppState()
                                                          .editedWeekDayTimeRange =
                                                      WeekDayTimeRangeStruct();
                                                  FFAppState()
                                                          .editedWeekDayTimeRangeAction =
                                                      null;
                                                  FFAppState().editedMenuOffer =
                                                      MenuOfferStruct();
                                                  FFAppState()
                                                          .editedMenuOfferAction =
                                                      null;
                                                  FFAppState()
                                                          .editedLocalDateTimeRange =
                                                      LocalDateTimeRangeStruct();
                                                  FFAppState()
                                                          .editedLocalDateTimeRangeAction =
                                                      null;
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child: ListTile(
                                                    title: Text(
                                                      valueOrDefault<String>(
                                                        menuOffersItem.name,
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    subtitle: Text(
                                                      'Cena bazowa: ${menuOffersItem.basePrice.amount.toString()} ${menuOffersItem.basePrice.currencyCode}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    trailing: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    tileColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    dense: false,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 45.0,
                                      borderWidth: 1.0,
                                      buttonSize: 45.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      icon: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        FFAppState().editedMenuOffer =
                                            MenuOfferStruct();
                                        safeSetState(() {});
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: MenuOfferEditWidget(
                                                  isNew: true,
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        if (FFAppState()
                                                .editedMenuOfferAction ==
                                            ActionType.CREATE) {
                                          // Add new range
                                          _model.updatePlaceStruct(
                                            (e) => e
                                              ..updateMenuOffers(
                                                (e) => e.add(FFAppState()
                                                    .editedMenuOffer),
                                              ),
                                          );
                                          safeSetState(() {});
                                        }
                                        // Clear helper vars
                                        FFAppState().editedWeekDayTimeRange =
                                            WeekDayTimeRangeStruct();
                                        FFAppState()
                                                .editedWeekDayTimeRangeAction =
                                            null;
                                        FFAppState().editedMenuOffer =
                                            MenuOfferStruct();
                                        FFAppState().editedMenuOfferAction =
                                            null;
                                        FFAppState().editedLocalDateTimeRange =
                                            LocalDateTimeRangeStruct();
                                        FFAppState()
                                                .editedLocalDateTimeRangeAction =
                                            null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Icon(
                                            Icons.info_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Dane na tej stronie zostaną zapisane od razu po zamknięciu okna edycji konkretnego schematu.',
                                            maxLines: 4,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 700.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: (_model.apiRequestCompleter ??=
                                              Completer<ApiCallResponse>()
                                                ..complete(
                                                    LuncherCoreAPIGETSchemaGroup
                                                        .getAllForPlaceCall
                                                        .call(
                                                  authorization:
                                                      currentAuthenticationToken,
                                                  placeId: widget.placeId,
                                                )))
                                          .future,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final schemasListViewGetAllForPlaceResponse =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            final schemas = (schemasListViewGetAllForPlaceResponse
                                                            .jsonBody
                                                            .toList()
                                                            .map<ImportSchemaDtoStruct?>(
                                                                ImportSchemaDtoStruct
                                                                    .maybeFromMap)
                                                            .toList()
                                                        as Iterable<
                                                            ImportSchemaDtoStruct?>)
                                                    .withoutNulls
                                                    .toList() ??
                                                [];

                                            return RefreshIndicator(
                                              key: Key(
                                                  'RefreshIndicator_0iimem24'),
                                              onRefresh: () async {
                                                safeSetState(() =>
                                                    _model.apiRequestCompleter =
                                                        null);
                                              },
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: schemas.length,
                                                itemBuilder:
                                                    (context, schemasIndex) {
                                                  final schemasItem =
                                                      schemas[schemasIndex];
                                                  return Builder(
                                                    builder: (context) =>
                                                        InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                                .editedImportSchema =
                                                            functions
                                                                .cloneImportSchemaObject(
                                                                    schemasItem)!;
                                                        FFAppState()
                                                                .editedImportSchemaAction =
                                                            null;
                                                        safeSetState(() {});
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    ImportDetailsWidgetWidget(
                                                                  isNew: false,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );

                                                        safeSetState(() => _model
                                                                .apiRequestCompleter =
                                                            null);
                                                        FFAppState()
                                                                .editedImportSchema =
                                                            ImportSchemaDtoStruct();
                                                        FFAppState()
                                                                .editedImportSchemaAction =
                                                            null;
                                                        safeSetState(() {});
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: ListTile(
                                                          title: Text(
                                                            schemasItem.name,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          subtitle: Text(
                                                            '${schemasItem.importCronDescription} / ${schemasItem.schemaType}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          trailing: Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          tileColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          dense: false,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 45.0,
                                      borderWidth: 1.0,
                                      buttonSize: 45.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      icon: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        FFAppState().editedImportSchema =
                                            ImportSchemaDtoStruct(
                                          name: '',
                                          importCron: '0 0 10 * * ?',
                                          enabled: true,
                                          schemaType: 'FACEBOOK_TEXT',
                                          id: '',
                                          placeId: widget.placeId,
                                        );
                                        FFAppState().editedImportSchemaAction =
                                            null;
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child:
                                                    ImportDetailsWidgetWidget(
                                                  isNew: true,
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        safeSetState(() =>
                                            _model.apiRequestCompleter = null);
                                        // Clear helper vars
                                        FFAppState().editedImportSchemaAction =
                                            null;
                                        FFAppState().editedImportSchema =
                                            ImportSchemaDtoStruct();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Wrap(
                              spacing: 20.0,
                              runSpacing: 20.0,
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.center,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 350.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            var _shouldSetState = false;
                                            _model.googleMapsApiCallResult =
                                                await GooglePlacesAPIGroup
                                                    .textSearchCall
                                                    .call(
                                              textQuery:
                                                  '${_model.nameInputTextController.text} ${_model.addressCityTextController.text}',
                                            );

                                            _shouldSetState = true;
                                            if ((_model.googleMapsApiCallResult
                                                    ?.succeeded ??
                                                true)) {
                                              FFAppState()
                                                  .selectedGoogleMapPlacesApiIndex = -1;
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          SelectGooglePlacesApiAddressWidget(
                                                        places:
                                                            GooglePlacesAPIGroup
                                                                .textSearchCall
                                                                .places(
                                                          (_model.googleMapsApiCallResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              if (FFAppState()
                                                      .selectedGoogleMapPlacesApiIndex >=
                                                  0) {
                                                safeSetState(() {
                                                  _model
                                                      .locationLatTextController
                                                      ?.text = (GooglePlacesAPIGroup
                                                          .textSearchCall
                                                          .places(
                                                            (_model.googleMapsApiCallResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                          .elementAtOrNull(
                                                              FFAppState()
                                                                  .selectedGoogleMapPlacesApiIndex))!
                                                      .location
                                                      .latitude
                                                      .toString();
                                                });
                                                safeSetState(() {
                                                  _model
                                                      .locationLonTextController
                                                      ?.text = (GooglePlacesAPIGroup
                                                          .textSearchCall
                                                          .places(
                                                            (_model.googleMapsApiCallResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                          .elementAtOrNull(
                                                              FFAppState()
                                                                  .selectedGoogleMapPlacesApiIndex))!
                                                      .location
                                                      .longitude
                                                      .toString();
                                                });
                                                await _model
                                                    .googleMapsController.future
                                                    .then(
                                                  (c) => c.animateCamera(
                                                    CameraUpdate.newLatLng(
                                                        functions
                                                            .locationToLatLng(
                                                                LocationStruct(
                                                              latitude: double
                                                                  .tryParse(_model
                                                                      .locationLatTextController
                                                                      .text),
                                                              longitude: double
                                                                  .tryParse(_model
                                                                      .locationLonTextController
                                                                      .text),
                                                            ))!
                                                            .toGoogleMaps()),
                                                  ),
                                                );
                                                safeSetState(() {
                                                  _model
                                                      .googlePlaceIdInputTextController
                                                      ?.text = (GooglePlacesAPIGroup
                                                          .textSearchCall
                                                          .places(
                                                            (_model.googleMapsApiCallResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!
                                                          .elementAtOrNull(
                                                              FFAppState()
                                                                  .selectedGoogleMapPlacesApiIndex))!
                                                      .id;
                                                });
                                                safeSetState(() {
                                                  _model.address1stLineTextController
                                                          ?.text =
                                                      '${functions.getGoogleAddressComponent(GooglePlacesAPIGroup.textSearchCall.places(
                                                            (_model.googleMapsApiCallResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList(), FFAppState().selectedGoogleMapPlacesApiIndex, 'route').longText} ${functions.getGoogleAddressComponent(GooglePlacesAPIGroup.textSearchCall.places(
                                                            (_model.googleMapsApiCallResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList(), FFAppState().selectedGoogleMapPlacesApiIndex, 'street_number').longText}';
                                                });
                                                safeSetState(() {
                                                  _model.addressZipCodeTextController?.text =
                                                      functions
                                                          .getGoogleAddressComponent(
                                                              GooglePlacesAPIGroup
                                                                  .textSearchCall
                                                                  .places(
                                                                    (_model.googleMapsApiCallResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                  ?.toList(),
                                                              FFAppState()
                                                                  .selectedGoogleMapPlacesApiIndex,
                                                              'postal_code')
                                                          .longText;
                                                });
                                                safeSetState(() {
                                                  _model.addressCityTextController?.text =
                                                      functions
                                                          .getGoogleAddressComponent(
                                                              GooglePlacesAPIGroup
                                                                  .textSearchCall
                                                                  .places(
                                                                    (_model.googleMapsApiCallResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                  ?.toList(),
                                                              FFAppState()
                                                                  .selectedGoogleMapPlacesApiIndex,
                                                              'locality')
                                                          .longText;
                                                });
                                                safeSetState(() {
                                                  _model.addressDistrictTextController?.text =
                                                      functions
                                                          .getGoogleAddressComponent(
                                                              GooglePlacesAPIGroup
                                                                  .textSearchCall
                                                                  .places(
                                                                    (_model.googleMapsApiCallResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                  ?.toList(),
                                                              FFAppState()
                                                                  .selectedGoogleMapPlacesApiIndex,
                                                              'sublocality')
                                                          .longText;
                                                });
                                                safeSetState(() {
                                                  _model.addressCountryTextController?.text =
                                                      functions
                                                          .getGoogleAddressComponent(
                                                              GooglePlacesAPIGroup
                                                                  .textSearchCall
                                                                  .places(
                                                                    (_model.googleMapsApiCallResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                  ?.toList(),
                                                              FFAppState()
                                                                  .selectedGoogleMapPlacesApiIndex,
                                                              'country')
                                                          .shortText;
                                                });
                                              } else {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              FFAppState()
                                                  .selectedGoogleMapPlacesApiIndex = -1;
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Niepowodzenie zapytania do Google Maps. Sporóbuj ponownie!',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                          text: 'Pobierz wg nazwy i miasta',
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconAlignment: IconAlignment.end,
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 350.0,
                                        child: TextFormField(
                                          controller: _model
                                              .address1stLineTextController,
                                          focusNode:
                                              _model.address1stLineFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: '1-sza linia',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            alignLabelWithHint: true,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .address1stLineTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Container(
                                        width: 350.0,
                                        child: TextFormField(
                                          controller: _model
                                              .address2ndLineTextController,
                                          focusNode:
                                              _model.address2ndLineFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: '2-ga linia',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            alignLabelWithHint: true,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .address2ndLineTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: TextFormField(
                                              controller: _model
                                                  .addressZipCodeTextController,
                                              focusNode: _model
                                                  .addressZipCodeFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'Kod pocztowy',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                alignLabelWithHint: true,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .addressZipCodeTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            child: TextFormField(
                                              controller: _model
                                                  .addressCityTextController,
                                              focusNode:
                                                  _model.addressCityFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'Miasto',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                alignLabelWithHint: true,
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .addressCityTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 20.0)),
                                      ),
                                      Container(
                                        width: 350.0,
                                        child: TextFormField(
                                          controller: _model
                                              .addressDistrictTextController,
                                          focusNode:
                                              _model.addressDistrictFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                'Dzielnica/Region miasta',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            alignLabelWithHint: true,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .addressDistrictTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Container(
                                        width: 350.0,
                                        child: TextFormField(
                                          controller: _model
                                              .addressCountryTextController,
                                          focusNode:
                                              _model.addressCountryFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Kraj',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            alignLabelWithHint: true,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .addressCountryTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Lokalizacja - współrzędne:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: TextFormField(
                                              controller: _model
                                                  .locationLatTextController,
                                              focusNode:
                                                  _model.locationLatFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.locationLatTextController',
                                                Duration(milliseconds: 1000),
                                                () async {
                                                  await _model
                                                      .googleMapsController
                                                      .future
                                                      .then(
                                                    (c) => c.animateCamera(
                                                      CameraUpdate.newLatLng(
                                                          functions
                                                              .locationToLatLng(
                                                                  LocationStruct(
                                                                latitude: double
                                                                    .tryParse(_model
                                                                        .locationLatTextController
                                                                        .text),
                                                                longitude: double
                                                                    .tryParse(_model
                                                                        .locationLonTextController
                                                                        .text),
                                                              ))!
                                                              .toGoogleMaps()),
                                                    ),
                                                  );
                                                },
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'Szerokość (N/S)',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                alignLabelWithHint: true,
                                                hintText: 'N -> +  / S -> -',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .locationLatTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: TextFormField(
                                              controller: _model
                                                  .locationLonTextController,
                                              focusNode:
                                                  _model.locationLonFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.locationLonTextController',
                                                Duration(milliseconds: 1000),
                                                () async {
                                                  await _model
                                                      .googleMapsController
                                                      .future
                                                      .then(
                                                    (c) => c.animateCamera(
                                                      CameraUpdate.newLatLng(
                                                          functions
                                                              .locationToLatLng(
                                                                  LocationStruct(
                                                                latitude: double
                                                                    .tryParse(_model
                                                                        .locationLatTextController
                                                                        .text),
                                                                longitude: double
                                                                    .tryParse(_model
                                                                        .locationLonTextController
                                                                        .text),
                                                              ))!
                                                              .toGoogleMaps()),
                                                    ),
                                                  );
                                                },
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'Długość (E/W)',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                alignLabelWithHint: true,
                                                hintText: 'E -> +  / W -> -',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .locationLonTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 20.0)),
                                      ),
                                      TextFormField(
                                        controller: _model
                                            .googlePlaceIdInputTextController,
                                        focusNode:
                                            _model.googlePlaceIdInputFocusNode,
                                        autofocus: false,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Google Place ID',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          alignLabelWithHint: true,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .googlePlaceIdInputTextControllerValidator
                                            .asValidator(context),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          'Strefa czasowa:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: FFAppState().getTimezones(
                                                requestFn: () =>
                                                    LuncherCoreAPIGETUtilsTzGroup
                                                        .getAvailableTimezonesCall
                                                        .call(
                                                  authorization:
                                                      currentAuthenticationToken,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final timeZoneDropDownGetAvailableTimezonesResponse =
                                                    snapshot.data!;

                                                return FlutterFlowDropDown<
                                                    String>(
                                                  controller: _model
                                                          .timeZoneDropDownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.timeZoneDropDownValue ??=
                                                        _model.place?.timeZone,
                                                  ),
                                                  options:
                                                      LuncherCoreAPIGETUtilsTzGroup
                                                          .getAvailableTimezonesCall
                                                          .timezones(
                                                    timeZoneDropDownGetAvailableTimezonesResponse
                                                        .jsonBody,
                                                  )!,
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .timeZoneDropDownValue =
                                                          val),
                                                  height: 40.0,
                                                  searchHintTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  searchTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: 'Wyszukaj...',
                                                  searchHintText: 'Wyszukaj...',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: true,
                                                  isMultiSelect: false,
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: !((_model.locationLatTextController
                                                                  .text !=
                                                              '') &&
                                                      (_model.locationLonTextController
                                                                  .text !=
                                                              ''))
                                                  ? null
                                                  : () async {
                                                      _model.apiResult6g4 =
                                                          await LuncherCoreAPIGETUtilsTzqueryGroup
                                                              .getTimezoneCall
                                                              .call(
                                                        authorization:
                                                            currentAuthenticationToken,
                                                        lat: _model
                                                            .locationLatTextController
                                                            .text,
                                                        lon: _model
                                                            .locationLonTextController
                                                            .text,
                                                      );

                                                      if ((_model.apiResult6g4
                                                              ?.succeeded ??
                                                          true)) {
                                                        safeSetState(() {
                                                          _model
                                                              .timeZoneDropDownValueController
                                                              ?.value = (_model
                                                                  .apiResult6g4
                                                                  ?.bodyText ??
                                                              '');
                                                        });
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Nie udało się pobrać strefy czasowej! ${ErrorDtoStruct.maybeFromMap((_model.apiResult6g4?.jsonBody ?? ''))?.message}',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }

                                                      safeSetState(() {});
                                                    },
                                              text: 'Pobierz str. czas.',
                                              icon: Icon(
                                                Icons.replay,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                disabledColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                disabledTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Icon(
                                                Icons.info_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                'Pobranie strefy czasowej jest możliwe po wypełnieniu współrzędnych - można je uzupełnić przyciskiem \'Pobierz wg...\' u góry strony.',
                                                maxLines: 4,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 15.0)),
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 400.0,
                                    maxHeight: 400.0,
                                  ),
                                  child: Builder(builder: (context) {
                                    final _googleMapMarker = functions
                                        .locationToLatLng(LocationStruct(
                                      latitude: double.tryParse(_model
                                          .locationLatTextController.text),
                                      longitude: double.tryParse(_model
                                          .locationLonTextController.text),
                                    ));
                                    return FlutterFlowGoogleMap(
                                      controller: _model.googleMapsController,
                                      onCameraIdle: (latLng) =>
                                          _model.googleMapsCenter = latLng,
                                      initialLocation:
                                          _model.googleMapsCenter ??= functions
                                              .locationToLatLng(LocationStruct(
                                        latitude: double.tryParse(_model
                                            .locationLatTextController.text),
                                        longitude: double.tryParse(_model
                                            .locationLonTextController.text),
                                      ))!,
                                      markers: [
                                        if (_googleMapMarker != null)
                                          FlutterFlowMarker(
                                            _googleMapMarker.serialize(),
                                            _googleMapMarker,
                                          ),
                                      ],
                                      markerColor: GoogleMarkerColor.violet,
                                      mapType: MapType.normal,
                                      style: GoogleMapStyle.standard,
                                      initialZoom: 15.0,
                                      allowInteraction: true,
                                      allowZoom: true,
                                      showZoomControls: true,
                                      showLocation: true,
                                      showCompass: false,
                                      showMapToolbar: false,
                                      showTraffic: false,
                                      centerMapOnMarkerTap: true,
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 400.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller:
                                          _model.facebookPageIdTextController,
                                      focusNode: _model.facebookPageIdFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'Facebook Page ID',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        alignLabelWithHint: true,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .facebookPageIdTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    Text(
                                      'ID strony z końca linku: np. \'moja strona\' z: \nfacebook.com/mojastrona',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller: _model
                                            .instagramHandleTextController,
                                        focusNode:
                                            _model.instagramHandleFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Instagram Handle',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          alignLabelWithHint: true,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .instagramHandleTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Text(
                                      'Instagram Handle (np. @abcdef)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.websiteUrlTextController,
                                        focusNode: _model.websiteUrlFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Strona WWW',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          alignLabelWithHint: true,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        keyboardType: TextInputType.url,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .websiteUrlTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.phoneNumberTextController,
                                        focusNode: _model.phoneNumberFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Nr telefonu',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          alignLabelWithHint: true,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        keyboardType: TextInputType.phone,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .phoneNumberTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 505.0,
                          height: 50.0,
                          child: custom_widgets.MyCircularProgressIndicator(
                            width: 505.0,
                            height: 50.0,
                            size: 50.0,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
