import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/backend/schema/structs/index.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'create_place_dialog_model.dart';
export 'create_place_dialog_model.dart';

class CreatePlaceDialogWidget extends StatefulWidget {
  const CreatePlaceDialogWidget({super.key});

  @override
  State<CreatePlaceDialogWidget> createState() =>
      _CreatePlaceDialogWidgetState();
}

class _CreatePlaceDialogWidgetState extends State<CreatePlaceDialogWidget> {
  late CreatePlaceDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePlaceDialogModel());

    _model.nameInputTextController ??= TextEditingController();
    _model.nameInputFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        constraints: BoxConstraints(
          maxWidth: 700.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tworzenie lokalu',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                      child: Text(
                        'Nazwa',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 10.0),
                      child: TextFormField(
                        controller: _model.nameInputTextController,
                        focusNode: _model.nameInputFocusNode,
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                        minLines: 1,
                        validator: _model.nameInputTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                        child: Text(
                          'Typ lokalu',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: FutureBuilder<ApiCallResponse>(
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final placeTypeSelectorGetAllPlaceTypesResponse =
                              snapshot.data!;

                          return FlutterFlowDropDown<String>(
                            controller:
                                _model.placeTypeSelectorValueController ??=
                                    FormFieldController<String>(
                              _model.placeTypeSelectorValue ??= '',
                            ),
                            options: List<String>.from(
                                (placeTypeSelectorGetAllPlaceTypesResponse
                                        .jsonBody
                                        .toList()
                                        .map<PlaceTypeStruct?>(
                                            PlaceTypeStruct.maybeFromMap)
                                        .toList() as Iterable<PlaceTypeStruct?>)
                                    .withoutNulls
                                    .map((e) => e.identifier)
                                    .toList()),
                            optionLabels:
                                (placeTypeSelectorGetAllPlaceTypesResponse
                                        .jsonBody
                                        .toList()
                                        .map<PlaceTypeStruct?>(
                                            PlaceTypeStruct.maybeFromMap)
                                        .toList() as Iterable<PlaceTypeStruct?>)
                                    .withoutNulls
                                    .map((e) => e.name)
                                    .toList(),
                            onChanged: (val) => safeSetState(
                                () => _model.placeTypeSelectorValue = val),
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Rodzaj lokalu',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 0.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Anuluj',
                    options: FFButtonOptions(
                      width: 100.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
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
                    onPressed: () async {
                      var _shouldSetState = false;
                      _model.createResult = await LuncherCoreAPIPOSTPlaceGroup
                          .createPlaceCall
                          .call(
                        authorization: currentAuthenticationToken,
                        name: _model.nameInputTextController.text,
                        placeTypeIdentifier: _model.placeTypeSelectorValue,
                        enabled: false.toString(),
                      );

                      _shouldSetState = true;
                      if ((_model.createResult?.succeeded ?? true)) {
                        Navigator.pop(context);

                        context.pushNamed(
                          PlaceDetailsPageWidget.routeName,
                          queryParameters: {
                            'placeId': serializeParam(
                              PlaceDtoStruct.maybeFromMap(
                                      (_model.createResult?.jsonBody ?? ''))
                                  ?.id,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Stworzono pomyślnie!',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Niepowodzenie'),
                              content: Text('Nie udało się stworzyć lokalu!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
                    text: 'Stwórz',
                    options: FFButtonOptions(
                      width: 100.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
