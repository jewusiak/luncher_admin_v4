import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'section_element_edit_model.dart';
export 'section_element_edit_model.dart';

class SectionElementEditWidget extends StatefulWidget {
  const SectionElementEditWidget({
    super.key,
    bool? isNew,
  }) : isNew = isNew ?? false;

  final bool isNew;

  @override
  State<SectionElementEditWidget> createState() =>
      _SectionElementEditWidgetState();
}

class _SectionElementEditWidgetState extends State<SectionElementEditWidget> {
  late SectionElementEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionElementEditModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.typesResults =
          await LuncherCoreAPIGETPlacetypeGroup.getAllPlaceTypesCall.call(
        authorization: currentAuthenticationToken,
      );

      _model.availablePlaceTypes = ((_model.typesResults?.jsonBody ?? '')
              .toList()
              .map<PlaceTypeStruct?>(PlaceTypeStruct.maybeFromMap)
              .toList() as Iterable<PlaceTypeStruct?>)
          .withoutNulls
          .map((e) => e.identifier)
          .toList()
          .toList()
          .cast<String>();
      safeSetState(() {});
      if (!widget.isNew &&
          (FFAppState().editedSectionElement.elementType == 'PLACE_TYPE')) {
        safeSetState(() {
          _model.placeTypeSelectorValueController?.value =
              FFAppState().editedSectionElement.sourceElementId;
        });
      }
      if (!widget.isNew) {
        _model.searchPlaceResult =
            await LuncherCoreAPIGETPlaceUuidGroup.getByIdCall.call(
          authorization: currentAuthenticationToken,
          uuid: _model.indentificatorInputTextController.text,
        );

        if ((_model.searchPlaceResult?.succeeded ?? true)) {
          _model.placeSearchInfoText =
              'Znaleziono: ${PlaceDtoStruct.maybeFromMap((_model.searchPlaceResult?.jsonBody ?? ''))?.name}';
          _model.isIdValid = true;
          safeSetState(() {});
        } else {
          _model.placeSearchInfoText = 'Nie znaleziono miejsca...';
          _model.isIdValid = false;
          safeSetState(() {});
        }
      }
    });

    _model.headerInputTextController ??=
        TextEditingController(text: FFAppState().editedSectionElement.header);
    _model.headerInputFocusNode ??= FocusNode();

    _model.subHeaderInputTextController ??= TextEditingController(
        text: FFAppState().editedSectionElement.subheader);
    _model.subHeaderInputFocusNode ??= FocusNode();

    _model.indentificatorInputTextController ??= TextEditingController(
        text: FFAppState().editedSectionElement.sourceElementId);
    _model.indentificatorInputFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 1000.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Text(
                    'Edycja elementu sekcji',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                TextFormField(
                  controller: _model.headerInputTextController,
                  focusNode: _model.headerInputFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Nagłówek',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    alignLabelWithHint: true,
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.headerInputTextControllerValidator
                      .asValidator(context),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _model.subHeaderInputTextController,
                    focusNode: _model.subHeaderInputFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Nagłówek 2-giego stopnia',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                      alignLabelWithHint: true,
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                    validator: _model.subHeaderInputTextControllerValidator
                        .asValidator(context),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                    child: Wrap(
                      spacing: 15.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.spaceAround,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        FlutterFlowDropDown<String>(
                          controller:
                              _model.elementTypeSelectorValueController ??=
                                  FormFieldController<String>(
                            _model.elementTypeSelectorValue ??=
                                FFAppState().editedSectionElement.elementType,
                          ),
                          options: SectionElementSourceElementType.values
                              .map((e) => e.name)
                              .toList(),
                          onChanged: (val) => safeSetState(
                              () => _model.elementTypeSelectorValue = val),
                          width: 200.0,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Typ elementu',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        Builder(
                          builder: (context) {
                            if (valueOrDefault<bool>(
                              _model.elementTypeSelectorValue ==
                                  SectionElementSourceElementType
                                      .PLACE_TYPE.name,
                              true,
                            )) {
                              return FutureBuilder<ApiCallResponse>(
                                future: LuncherCoreAPIGETPlacetypeGroup
                                    .getAllPlaceTypesCall
                                    .call(
                                  authorization: currentAuthenticationToken,
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
                                              AlwaysStoppedAnimation<Color>(
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
                                        FormFieldController<String>(null),
                                    options: _model.availablePlaceTypes,
                                    onChanged: (val) async {
                                      safeSetState(() =>
                                          _model.placeTypeSelectorValue = val);
                                      _model.isIdValid =
                                          _model.placeTypeSelectorValue !=
                                              FFAppConstants.nullvalue;
                                      safeSetState(() {});
                                    },
                                    width: 200.0,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(
                                            width: 400.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .indentificatorInputTextController,
                                              focusNode: _model
                                                  .indentificatorInputFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.indentificatorInputTextController',
                                                const Duration(milliseconds: 200),
                                                () async {
                                                  _model.searchPlaceResult2 =
                                                      await LuncherCoreAPIGETPlaceUuidGroup
                                                          .getByIdCall
                                                          .call(
                                                    authorization:
                                                        currentAuthenticationToken,
                                                    uuid: _model
                                                        .indentificatorInputTextController
                                                        .text,
                                                  );

                                                  if ((_model.searchPlaceResult2
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.placeSearchInfoText =
                                                        'Znaleziono: ${PlaceDtoStruct.maybeFromMap((_model.searchPlaceResult2?.jsonBody ?? ''))?.name}';
                                                    _model.isIdValid = true;
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.placeSearchInfoText =
                                                        'Nie znaleziono miejsca...';
                                                    _model.isIdValid = false;
                                                    safeSetState(() {});
                                                  }

                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'ID Lokalu',
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
                                                  .indentificatorInputTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Text(
                                            _model.placeSearchInfoText,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.upload,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          showLoadingIndicator: true,
                          onPressed: () async {
                            final selectedMedia = await selectMedia(
                              mediaSource: MediaSource.photoGallery,
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                  selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            _model.uploadApiCallResult =
                                await LuncherCoreAPIPOSTAssetGroup
                                    .uploadImageCall
                                    .call(
                              authorization: currentAuthenticationToken,
                              description: 'SectionElement',
                              file: _model.uploadedLocalFile,
                            );

                            if ((_model.uploadApiCallResult?.succeeded ??
                                true)) {
                              FFAppState().updateEditedSectionElementStruct(
                                (e) => e
                                  ..thumbnail = AssetStruct.maybeFromMap(
                                      (_model.uploadApiCallResult?.jsonBody ??
                                          '')),
                              );
                              safeSetState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Nie udało się wrzucić zdjęcia',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: OctoImage(
                            placeholderBuilder: (_) => SizedBox.expand(
                              child: Image(
                                image: BlurHashImage(FFAppState()
                                    .editedSectionElement
                                    .thumbnail
                                    .blurHash),
                                fit: BoxFit.cover,
                              ),
                            ),
                            image: NetworkImage(
                              FFAppState()
                                  .editedSectionElement
                                  .thumbnail
                                  .accessUrl,
                            ),
                            width: 250.0,
                            height: 250.0,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.png',
                              width: 250.0,
                              height: 250.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            FFAppState().editedSectionElementAction = null;
                            FFAppState().editedSectionElement =
                                SectionElementDtoStruct();
                            Navigator.pop(context);
                          },
                          text: 'Anuluj',
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: widget.isNew
                              ? null
                              : () async {
                                  FFAppState().editedSectionElementAction =
                                      ActionType.DELETE;
                                  Navigator.pop(context);
                                },
                          text: 'Usuń',
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).error,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor: const Color(0xFFE9E9E9),
                            disabledTextColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            if (((_model.elementTypeSelectorValue ==
                                        SectionElementSourceElementType
                                            .PLACE.name) &&
                                    _model.isIdValid &&
                                    (_model.indentificatorInputTextController
                                                .text !=
                                            '')) ||
                                ((_model.elementTypeSelectorValue ==
                                        SectionElementSourceElementType
                                            .PLACE_TYPE.name) &&
                                    (_model.placeTypeSelectorValue != null &&
                                        _model.placeTypeSelectorValue != ''))) {
                              FFAppState().updateEditedSectionElementStruct(
                                (e) => e
                                  ..elementType =
                                      _model.elementTypeSelectorValue
                                  ..header =
                                      _model.headerInputTextController.text
                                  ..subheader =
                                      _model.subHeaderInputTextController.text
                                  ..sourceElementId =
                                      _model.elementTypeSelectorValue ==
                                              SectionElementSourceElementType
                                                  .PLACE.name
                                          ? _model
                                              .indentificatorInputTextController
                                              .text
                                          : _model.placeTypeSelectorValue,
                              );
                              safeSetState(() {});
                              if (widget.isNew) {
                                FFAppState().editedSectionElementAction =
                                    ActionType.CREATE;
                              } else {
                                FFAppState().editedSectionElementAction =
                                    ActionType.UPDATE;
                              }

                              context.safePop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Wybierz poprawny identyfikator!',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }
                          },
                          text: 'OK',
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 0.0)),
            ),
          ),
        ),
      ),
    );
  }
}
