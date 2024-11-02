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
import '/places_management/place_opening_hour_edit/place_opening_hour_edit_widget.dart';
import '/places_management/select_google_places_api_address/select_google_places_api_address_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'place_details_page_model.dart';
export 'place_details_page_model.dart';

class PlaceDetailsPageWidget extends StatefulWidget {
  const PlaceDetailsPageWidget({
    super.key,
    required this.placeId,
  });

  final String? placeId;

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
          _model.nameInputTextController?.selection = TextSelection.collapsed(
              offset: _model.nameInputTextController!.text.length);
        });
        safeSetState(() {
          _model.longNameInputTextController?.text = _model.place!.longName;
          _model.longNameInputTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.longNameInputTextController!.text.length);
        });
        safeSetState(() {
          _model.placeDescriptionInputTextController?.text =
              _model.place!.description;
          _model.placeDescriptionInputTextController?.selection =
              TextSelection.collapsed(
                  offset:
                      _model.placeDescriptionInputTextController!.text.length);
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
          _model.address1stLineTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.address1stLineTextController!.text.length);
        });
        safeSetState(() {
          _model.address2ndLineTextController?.text =
              _model.place!.address.secondLine;
          _model.address2ndLineTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.address2ndLineTextController!.text.length);
        });
        safeSetState(() {
          _model.addressZipCodeTextController?.text =
              _model.place!.address.zipCode;
          _model.addressZipCodeTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.addressZipCodeTextController!.text.length);
        });
        safeSetState(() {
          _model.addressCityTextController?.text = _model.place!.address.city;
          _model.addressCityTextController?.selection = TextSelection.collapsed(
              offset: _model.addressCityTextController!.text.length);
        });
        safeSetState(() {
          _model.addressDistrictTextController?.text =
              _model.place!.address.district;
          _model.addressDistrictTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.addressDistrictTextController!.text.length);
        });
        safeSetState(() {
          _model.addressCountryTextController?.text =
              _model.place!.address.country;
          _model.addressCountryTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.addressCountryTextController!.text.length);
        });
        safeSetState(() {
          _model.locationLatTextController?.text =
              _model.place!.location.latitude.toString();
          _model.locationLatTextController?.selection = TextSelection.collapsed(
              offset: _model.locationLatTextController!.text.length);
        });
        safeSetState(() {
          _model.locationLonTextController?.text =
              _model.place!.location.longitude.toString();
          _model.locationLonTextController?.selection = TextSelection.collapsed(
              offset: _model.locationLonTextController!.text.length);
        });
        safeSetState(() {
          _model.googlePlaceIdInputTextController?.text =
              _model.place!.googleMapsReference;
          _model.googlePlaceIdInputTextController?.selection =
              TextSelection.collapsed(
                  offset: _model.googlePlaceIdInputTextController!.text.length);
        });
        return;
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Błąd'),
              content: const Text('Nie udało się pobrać danych o lokalu!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 6,
      initialIndex: 0,
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
      onTap: () => FocusScope.of(context).unfocus(),
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
            icon: const Icon(
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
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
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
                  var shouldSetState = false;
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
                  );

                  shouldSetState = true;
                  if ((_model.saveResult?.succeeded ?? true)) {
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed(
                      'PlaceDetailsPage',
                      queryParameters: {
                        'placeId': serializeParam(
                          widget.placeId,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Pomyślnie zapisano!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 1000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    if (shouldSetState) safeSetState(() {});
                    return;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Błąd w zapisie! ',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    if (shouldSetState) safeSetState(() {});
                    return;
                  }

                  if (shouldSetState) safeSetState(() {});
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
                      alignment: const Alignment(0.0, 0),
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
                        tabs: const [
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
                            () async {}
                          ][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          KeepAliveWidgetWrapper(
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Wrap(
                                  spacing: 20.0,
                                  runSpacing: 20.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          width: 350.0,
                                          child: TextFormField(
                                            controller:
                                                _model.nameInputTextController,
                                            focusNode:
                                                _model.nameInputFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText: 'Nazwa lokalu',
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
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                        SizedBox(
                                          width: 350.0,
                                          child: TextFormField(
                                            controller: _model
                                                .longNameInputTextController,
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
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .placeTypeSelectorValue =
                                                      val),
                                              width: 200.0,
                                              height: 40.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Rodzaj lokalu',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 550.0,
                                          child: TextFormField(
                                            controller: _model
                                                .placeDescriptionInputTextController,
                                            focusNode: _model
                                                .placeDescriptionInputFocusNode,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText: 'Opis lokalu',
                                              alignLabelWithHint: true,
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                            keyboardType:
                                                TextInputType.multiline,
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Switch.adaptive(
                                              value: _model
                                                  .placeEnabledSwitchValue!,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                        .placeEnabledSwitchValue =
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
                                          ].divide(const SizedBox(width: 10.0)),
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
                                      ].divide(const SizedBox(height: 15.0)),
                                    ),
                                  ],
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
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 700.0,
                                    ),
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                            alignment: const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () =>
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus(),
                                                              child:
                                                                  const PlaceOpeningHourEditWidget(),
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
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: ListTile(
                                                        title: Text(
                                                          '${openingWindowsItem.startTime.day}, ${openingWindowsItem.startTime.time} - ${openingWindowsItem.startTime.day == openingWindowsItem.endTime.day ? '' : '${openingWindowsItem.endTime.day}, '}${openingWindowsItem.endTime.time}',
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
                                                            const EdgeInsetsDirectional
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
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 45.0,
                                        borderWidth: 1.0,
                                        buttonSize: 45.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        icon: Icon(
                                          Icons.add,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          FFAppState().editedWeekDayTimeRange =
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
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: const AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          dialogContext)
                                                      .unfocus(),
                                                  child:
                                                      const PlaceOpeningHourEditWidget(
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
                                          FFAppState().editedWeekDayTimeRange =
                                              WeekDayTimeRangeStruct();
                                          FFAppState()
                                                  .editedWeekDayTimeRangeAction =
                                              null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  <Widget>[].divide(const SizedBox(height: 20.0)),
                            ),
                          ),
                          KeepAliveWidgetWrapper(
                            builder: (context) => const Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
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
                                  constraints: const BoxConstraints(
                                    maxWidth: 350.0,
                                  ),
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            var shouldSetState = false;
                                            _model.googleMapsApiCallResult =
                                                await GooglePlacesAPIGroup
                                                    .textSearchCall
                                                    .call(
                                              textQuery:
                                                  '${_model.nameInputTextController.text} ${_model.addressCityTextController.text}',
                                            );

                                            shouldSetState = true;
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
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus(),
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
                                                  )![FFAppState()
                                                          .selectedGoogleMapPlacesApiIndex])
                                                      .location
                                                      .latitude
                                                      .toString();
                                                  _model.locationLatTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .locationLatTextController!
                                                              .text
                                                              .length);
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
                                                  )![FFAppState()
                                                          .selectedGoogleMapPlacesApiIndex])
                                                      .location
                                                      .longitude
                                                      .toString();
                                                  _model.locationLonTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .locationLonTextController!
                                                              .text
                                                              .length);
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
                                                  )![FFAppState()
                                                          .selectedGoogleMapPlacesApiIndex])
                                                      .id;
                                                  _model.googlePlaceIdInputTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .googlePlaceIdInputTextController!
                                                              .text
                                                              .length);
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
                                                  _model.address1stLineTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .address1stLineTextController!
                                                              .text
                                                              .length);
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
                                                  _model.addressZipCodeTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .addressZipCodeTextController!
                                                              .text
                                                              .length);
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
                                                  _model.addressCityTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .addressCityTextController!
                                                              .text
                                                              .length);
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
                                                  _model.addressDistrictTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .addressDistrictTextController!
                                                              .text
                                                              .length);
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
                                                  _model.addressCountryTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                          offset: _model
                                                              .addressCountryTextController!
                                                              .text
                                                              .length);
                                                });
                                              } else {
                                                if (shouldSetState) {
                                                  safeSetState(() {});
                                                }
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
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              if (shouldSetState) {
                                                safeSetState(() {});
                                              }
                                              return;
                                            }

                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                          },
                                          text: 'Pobierz wg nazwy i miasta',
                                          icon: const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconAlignment: IconAlignment.end,
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
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
                                      SizedBox(
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
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
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
                                      SizedBox(
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
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
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
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
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
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
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
                                        ].divide(const SizedBox(width: 20.0)),
                                      ),
                                      SizedBox(
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
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
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
                                      SizedBox(
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
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
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
                                            const AlignmentDirectional(-1.0, 0.0),
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
                                                const Duration(milliseconds: 1000),
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
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
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
                                                const Duration(milliseconds: 1000),
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
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
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
                                        ].divide(const SizedBox(width: 20.0)),
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
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
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
                                    ].divide(const SizedBox(height: 15.0)),
                                  ),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 400.0,
                                    maxHeight: 400.0,
                                  ),
                                  child: Builder(builder: (context) {
                                    final googleMapMarker = functions
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
                                        if (googleMapMarker != null)
                                          FlutterFlowMarker(
                                            googleMapMarker.serialize(),
                                            googleMapMarker,
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
                            builder: (context) => const Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: SizedBox(
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
