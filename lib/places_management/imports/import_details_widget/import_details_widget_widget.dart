import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/places_management/imports/import_job_details/import_job_details_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'import_details_widget_model.dart';
export 'import_details_widget_model.dart';

class ImportDetailsWidgetWidget extends StatefulWidget {
  const ImportDetailsWidgetWidget({
    super.key,
    bool? isNew,
  }) : this.isNew = isNew ?? true;

  final bool isNew;

  @override
  State<ImportDetailsWidgetWidget> createState() =>
      _ImportDetailsWidgetWidgetState();
}

class _ImportDetailsWidgetWidgetState extends State<ImportDetailsWidgetWidget> {
  late ImportDetailsWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImportDetailsWidgetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedMinute = functions
          .splitString(FFAppState().editedImportSchema.importCron, ' ')
          ?.elementAtOrNull(1);
      _model.selectedHour = functions
          .splitString(FFAppState().editedImportSchema.importCron, ' ')
          ?.elementAtOrNull(2);
      _model.selectedDays = () {
        if ((functions
                .splitString(FFAppState().editedImportSchema.importCron, ' ')
                ?.elementAtOrNull(5)) ==
            '?') {
          return '';
        } else if ((functions
                .splitString(FFAppState().editedImportSchema.importCron, ' ')
                ?.elementAtOrNull(5)) ==
            '*') {
          return 'MON,TUE,WED,THU,FRI,SAT,SUN';
        } else {
          return (functions
              .splitString(FFAppState().editedImportSchema.importCron, ' ')!
              .elementAtOrNull(5))!;
        }
      }();
      safeSetState(() {});
      _model.apiResult6ic = await LuncherCoreAPIGETUtilsDescribeCronGroup
          .getCronDescriptionCall
          .call(
        authorization: currentAuthenticationToken,
        cron: FFAppState().editedImportSchema.importCron,
      );

      if ((_model.apiResult6ic?.succeeded ?? true)) {
        FFAppState().updateEditedImportSchemaStruct(
          (e) =>
              e..importCronDescription = (_model.apiResult6ic?.bodyText ?? ''),
        );
        safeSetState(() {});
      }
    });

    _model.nameTextFieldTextController ??=
        TextEditingController(text: FFAppState().editedImportSchema.name);
    _model.nameTextFieldFocusNode ??= FocusNode();

    _model.urlTextFieldTextController ??=
        TextEditingController(text: FFAppState().editedImportSchema.pageUrl);
    _model.urlTextFieldFocusNode ??= FocusNode();

    _model.postSelectionPromptTextFieldTextController ??= TextEditingController(
        text: FFAppState().editedImportSchema.postSelectionCustomPrompt);
    _model.postSelectionPromptTextFieldFocusNode ??= FocusNode();

    _model.importCustomPromptTextFieldTextController ??= TextEditingController(
        text: FFAppState().editedImportSchema.importCustomPrompt);
    _model.importCustomPromptTextFieldFocusNode ??= FocusNode();

    _model.importEnabledSwitchValue = FFAppState().editedImportSchema.enabled;
    _model.cronExpressionFieldTextController ??=
        TextEditingController(text: FFAppState().editedImportSchema.importCron);
    _model.cronExpressionFieldFocusNode ??= FocusNode();

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 1500.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Text(
                    'Edycja schematu importowania',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      FlutterFlowDropDown<String>(
                        controller: _model.schemaTypeDropDownValueController ??=
                            FormFieldController<String>(
                          _model.schemaTypeDropDownValue ??=
                              FFAppState().editedImportSchema.schemaType,
                        ),
                        options: List<String>.from(
                            ['FACEBOOK_TEXT', 'INSTAGRAM_TEXT']),
                        optionLabels: ['Facebook Text', 'Instagram Text'],
                        onChanged: (val) async {
                          safeSetState(
                              () => _model.schemaTypeDropDownValue = val);
                          _model.hasChanges = true;
                          safeSetState(() {});
                        },
                        width: 300.0,
                        height: 40.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Typ źródła',
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
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                      Container(
                        constraints: BoxConstraints(
                          minWidth: 250.0,
                          maxWidth: 500.0,
                        ),
                        decoration: BoxDecoration(),
                        child: TextFormField(
                          controller: _model.nameTextFieldTextController,
                          focusNode: _model.nameTextFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.nameTextFieldTextController',
                            Duration(milliseconds: 2000),
                            () async {
                              _model.hasChanges = true;
                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Nazwa importu',
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
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.nameTextFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          minWidth: 250.0,
                          maxWidth: 820.0,
                        ),
                        decoration: BoxDecoration(),
                        child: TextFormField(
                          controller: _model.urlTextFieldTextController,
                          focusNode: _model.urlTextFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.urlTextFieldTextController',
                            Duration(milliseconds: 2000),
                            () async {
                              _model.hasChanges = true;
                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Adres profilu (https://...)',
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
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.urlTextFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 15.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 500.0,
                          ),
                          decoration: BoxDecoration(),
                          child: TextFormField(
                            controller: _model
                                .postSelectionPromptTextFieldTextController,
                            focusNode:
                                _model.postSelectionPromptTextFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.postSelectionPromptTextFieldTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.hasChanges = true;
                                safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText:
                                  'Dodatkowe instrukcje promptu wybierania postu',
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
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: 10,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .postSelectionPromptTextFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 500.0,
                          ),
                          decoration: BoxDecoration(),
                          child: TextFormField(
                            controller: _model
                                .importCustomPromptTextFieldTextController,
                            focusNode:
                                _model.importCustomPromptTextFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.importCustomPromptTextFieldTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.hasChanges = true;
                                safeSetState(() {});
                              },
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText:
                                  'Dodatkowe instrukcje promptu interpretacji postu',
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
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: 10,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .importCustomPromptTextFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 15.0,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Switch.adaptive(
                              value: _model.importEnabledSwitchValue!,
                              onChanged: (newValue) async {
                                safeSetState(() => _model
                                    .importEnabledSwitchValue = newValue);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).primary,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            Text(
                              'Czy import aktywny?',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        FFButtonWidget(
                          onPressed: (_model.checkboxValue == true)
                              ? null
                              : () async {
                                  _model.timePicker =
                                      await actions.show24hTimePicker(
                                    context,
                                    '${_model.selectedHour}:${_model.selectedMinute}',
                                  );
                                  _model.selectedMinute = functions
                                      .splitString(_model.timePicker, ':')
                                      ?.elementAtOrNull(1);
                                  _model.selectedHour = functions
                                      .splitString(_model.timePicker, ':')
                                      ?.elementAtOrNull(0);
                                  safeSetState(() {});
                                  // update cron field
                                  safeSetState(() {
                                    _model.cronExpressionFieldTextController
                                            ?.text =
                                        '0 ${_model.selectedMinute} ${_model.selectedHour} ? * ${(_model.selectedDays == '') || (functions.splitString(_model.selectedDays, ',')?.length == 7) ? '*' : _model.selectedDays}';
                                  });
                                  _model.cronDescriptionResult =
                                      await LuncherCoreAPIGETUtilsDescribeCronGroup
                                          .getCronDescriptionCall
                                          .call(
                                    authorization: currentAuthenticationToken,
                                    cron: _model
                                        .cronExpressionFieldTextController.text,
                                  );

                                  if ((_model.cronDescriptionResult
                                              ?.statusCode ??
                                          200) ==
                                      200) {
                                    FFAppState().updateEditedImportSchemaStruct(
                                      (e) => e
                                        ..importCronDescription = (_model
                                                .cronDescriptionResult
                                                ?.bodyText ??
                                            ''),
                                    );
                                    safeSetState(() {});
                                  } else if ((_model.cronDescriptionResult
                                              ?.statusCode ??
                                          200) ==
                                      400) {
                                    FFAppState().updateEditedImportSchemaStruct(
                                      (e) => e
                                        ..importCronDescription =
                                            'Nieprawidłowe wyrażenie CRON',
                                    );
                                    safeSetState(() {});
                                  } else {
                                    FFAppState().updateEditedImportSchemaStruct(
                                      (e) => e
                                        ..importCronDescription =
                                            'Błąd opisywania momentu CRON',
                                    );
                                    safeSetState(() {});
                                  }

                                  _model.hasChanges = true;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                          text: functions.intsToTimeString(
                              _model.selectedHour, _model.selectedMinute)!,
                          icon: Icon(
                            Icons.access_time_outlined,
                            size: 18.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 100.0,
                              ),
                              decoration: BoxDecoration(),
                              child: FlutterFlowCheckboxGroup(
                                options: [
                                  'MON',
                                  'TUE',
                                  'WED',
                                  'THU',
                                  'FRI',
                                  'SAT',
                                  'SUN'
                                ],
                                onChanged: (_model.checkboxValue == true)
                                    ? null
                                    : (val) async {
                                        safeSetState(() => _model
                                            .dayOfWeekCheckboxesValues = val);
                                        _model.selectedDays =
                                            functions.joinString(
                                                _model.dayOfWeekCheckboxesValues
                                                    ?.toList(),
                                                ',')!;
                                        safeSetState(() {});
                                        // update cron field
                                        safeSetState(() {
                                          _model.cronExpressionFieldTextController
                                                  ?.text =
                                              '0 ${_model.selectedMinute} ${_model.selectedHour} ? * ${(_model.selectedDays == '') || (functions.splitString(_model.selectedDays, ',')?.length == 7) ? '*' : _model.selectedDays}';
                                        });
                                        _model.cronDescriptionResult2 =
                                            await LuncherCoreAPIGETUtilsDescribeCronGroup
                                                .getCronDescriptionCall
                                                .call(
                                          authorization:
                                              currentAuthenticationToken,
                                          cron: _model
                                              .cronExpressionFieldTextController
                                              .text,
                                        );

                                        if ((_model.cronDescriptionResult2
                                                    ?.statusCode ??
                                                200) ==
                                            200) {
                                          FFAppState()
                                              .updateEditedImportSchemaStruct(
                                            (e) => e
                                              ..importCronDescription = (_model
                                                      .cronDescriptionResult2
                                                      ?.bodyText ??
                                                  ''),
                                          );
                                          safeSetState(() {});
                                        } else if ((_model
                                                    .cronDescriptionResult2
                                                    ?.statusCode ??
                                                200) ==
                                            400) {
                                          FFAppState()
                                              .updateEditedImportSchemaStruct(
                                            (e) => e
                                              ..importCronDescription =
                                                  'Nieprawidłowe wyrażenie CRON',
                                          );
                                          safeSetState(() {});
                                        } else {
                                          FFAppState()
                                              .updateEditedImportSchemaStruct(
                                            (e) => e
                                              ..importCronDescription =
                                                  'Błąd opisywania momentu CRON',
                                          );
                                          safeSetState(() {});
                                        }

                                        _model.hasChanges = true;
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                controller: _model
                                        .dayOfWeekCheckboxesValueController ??=
                                    FormFieldController<List<String>>(
                                  List.from(functions.splitString(
                                          _model.selectedDays, ',') ??
                                      []),
                                ),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor: FlutterFlowTheme.of(context).info,
                                checkboxBorderColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                checkboxBorderRadius:
                                    BorderRadius.circular(4.0),
                                initialized:
                                    _model.dayOfWeekCheckboxesValues != null,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 700.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.checkboxValue = newValue!);
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Manualnie zdefiniuj wyrażenie CRON',
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
                              TextFormField(
                                controller:
                                    _model.cronExpressionFieldTextController,
                                focusNode: _model.cronExpressionFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.cronExpressionFieldTextController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    _model.cronDescriptionResult2Copy =
                                        await LuncherCoreAPIGETUtilsDescribeCronGroup
                                            .getCronDescriptionCall
                                            .call(
                                      authorization: currentAuthenticationToken,
                                      cron: _model
                                          .cronExpressionFieldTextController
                                          .text,
                                    );

                                    if ((_model.cronDescriptionResult2Copy
                                                ?.statusCode ??
                                            200) ==
                                        200) {
                                      FFAppState()
                                          .updateEditedImportSchemaStruct(
                                        (e) => e
                                          ..importCronDescription = (_model
                                                  .cronDescriptionResult2Copy
                                                  ?.bodyText ??
                                              ''),
                                      );
                                      safeSetState(() {});
                                    } else if ((_model
                                                .cronDescriptionResult2Copy
                                                ?.statusCode ??
                                            200) ==
                                        400) {
                                      FFAppState()
                                          .updateEditedImportSchemaStruct(
                                        (e) => e
                                          ..importCronDescription =
                                              'Nieprawidłowe wyrażenie CRON',
                                      );
                                      safeSetState(() {});
                                    } else {
                                      FFAppState()
                                          .updateEditedImportSchemaStruct(
                                        (e) => e
                                          ..importCronDescription =
                                              'Błąd opisywania momentu CRON',
                                      );
                                      safeSetState(() {});
                                    }

                                    _model.hasChanges = true;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                ),
                                autofocus: false,
                                readOnly: _model.checkboxValue == false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText:
                                      'Wyrażenie CRON (np. 0 0 10 ? * MON = każdy poniedziałek o 10:00)',
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .cronExpressionFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  FFAppState()
                                      .editedImportSchema
                                      .importCronDescription,
                                  'Zdefiniuj moment importu aby wyświelił się jego opis...',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!widget.isNew)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 750.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            child: ExpandableNotifier(
                              controller: _model.expandableExpandableController,
                              child: ExpandablePanel(
                                header: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Historia importów',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                collapsed: Container(),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: (_model.apiRequestCompleter ??=
                                            Completer<ApiCallResponse>()
                                              ..complete(
                                                  LuncherCoreAPIGETSchemaSchemaIdJobGroup
                                                      .getSchemasJobsCall
                                                      .call(
                                                schemaId: FFAppState()
                                                    .editedImportSchema
                                                    .id,
                                                authorization:
                                                    currentAuthenticationToken,
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
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewGetSchemasJobsResponse =
                                          snapshot.data!;

                                      return Builder(
                                        builder: (context) {
                                          final imports = (listViewGetSchemasJobsResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<ImportJobDtoStruct?>(
                                                              ImportJobDtoStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          ImportJobDtoStruct?>)
                                                  .withoutNulls
                                                  .toList() ??
                                              [];

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: imports.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 15.0),
                                            itemBuilder:
                                                (context, importsIndex) {
                                              final importsItem =
                                                  imports[importsIndex];
                                              return Builder(
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
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
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
                                                              ImportJobDetailsWidget(
                                                            jobId:
                                                                importsItem.id,
                                                            schemaId: FFAppState()
                                                                .editedImportSchema
                                                                .id,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      if (importsItem.status ==
                                                          'NEW')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .pending_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 32.0,
                                                          ),
                                                        ),
                                                      if (importsItem.status ==
                                                          'IN_PROGRESS')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.downloading,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 32.0,
                                                          ),
                                                        ),
                                                      if (importsItem.status ==
                                                          'SUCCESSFUL')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.done,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .success,
                                                            size: 32.0,
                                                          ),
                                                        ),
                                                      if (importsItem.status ==
                                                          'ERROR')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.error_outline,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 32.0,
                                                          ),
                                                        ),
                                                      if (importsItem.status ==
                                                          'CANCELLED')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.event_busy,
                                                            color: Color(
                                                                0xFF6F7B83),
                                                            size: 32.0,
                                                          ),
                                                        ),
                                                      Text(
                                                        'Import utworzony ${functions.dateTimeStringToString(importsItem.dateCreated)}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 28.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 5.0),
                    child: Wrap(
                      spacing: 0.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            FFAppState().editedImportSchemaAction = null;
                            Navigator.pop(context);
                          },
                          text: 'Anuluj',
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Czy na pewno chcesz usunąć?'),
                                                content: Text(
                                                    'Usunięcie chematu importu jest nieodwracalne!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Anuluj'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Usuń'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    _model.deleteCallResult =
                                        await LuncherCoreAPIDELETESchemaSchemaIdGroup
                                            .deleteImportSchemaCall
                                            .call(
                                      authorization: currentAuthenticationToken,
                                      schemaId:
                                          FFAppState().editedImportSchema.id,
                                    );

                                    if ((_model.deleteCallResult?.succeeded ??
                                        true)) {
                                      Navigator.pop(context);
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Błąd usuwania'),
                                            content: Text(
                                                ErrorDtoStruct.maybeFromMap(
                                                        (_model.deleteCallResult
                                                                ?.jsonBody ??
                                                            ''))!
                                                    .message),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  }

                                  safeSetState(() {});
                                },
                          text: 'Usuń',
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor: Color(0xFFE9E9E9),
                            disabledTextColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        if (!widget.isNew)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: _model.hasChanges
                                    ? null
                                    : () async {
                                        _model.apiResult5sx =
                                            await LuncherCoreAPIPOSTSchemaSchemaIdJobGroup
                                                .dispatchJobCall
                                                .call(
                                          authorization:
                                              currentAuthenticationToken,
                                          schemaId: FFAppState()
                                              .editedImportSchema
                                              .id,
                                        );

                                        safeSetState(() =>
                                            _model.apiRequestCompleter = null);
                                        if ((_model.apiResult5sx?.succeeded ??
                                            true)) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Powodzenie'),
                                                content: Text(
                                                    'Zakolejkowano import do wykonania'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Nie udało się uruchomić importu'),
                                                content: Text(ErrorDtoStruct
                                                        .maybeFromMap((_model
                                                                .apiResult5sx
                                                                ?.jsonBody ??
                                                            ''))!
                                                    .message),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                text: 'Wystartuj import teraz',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  disabledColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  disabledTextColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ),
                              if (_model.hasChanges)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                          'Zapisz zmiany aby wystartować import',
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
                            ],
                          ),
                        FFButtonWidget(
                          onPressed: () async {
                            FFAppState().updateEditedImportSchemaStruct(
                              (e) => e
                                ..name = _model.nameTextFieldTextController.text
                                ..importCron = _model
                                    .cronExpressionFieldTextController.text
                                ..enabled = _model.importEnabledSwitchValue
                                ..schemaType = _model.schemaTypeDropDownValue
                                ..pageUrl =
                                    _model.urlTextFieldTextController.text
                                ..postSelectionCustomPrompt = _model
                                    .postSelectionPromptTextFieldTextController
                                    .text
                                ..importCustomPrompt = _model
                                    .importCustomPromptTextFieldTextController
                                    .text,
                            );
                            if (widget.isNew) {
                              // schema create
                              _model.schemaCreateResult =
                                  await LuncherCoreAPIPOSTSchemaGroup
                                      .createImportSchemaCall
                                      .call(
                                authorization: currentAuthenticationToken,
                                schemaJson:
                                    FFAppState().editedImportSchema.toMap(),
                              );

                              if ((_model.schemaCreateResult?.succeeded ??
                                  true)) {
                                FFAppState().editedImportSchemaAction =
                                    ActionType.CREATE;
                                context.safePop();
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Błąd w tworzeniu importu!'),
                                      content: Text(
                                          '${ErrorDtoStruct.maybeFromMap((_model.schemaCreateResult?.jsonBody ?? ''))?.message}'),
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
                              }
                            } else {
                              // schema update
                              _model.schemaUpdateResult =
                                  await LuncherCoreAPIPUTSchemaSchemaIdGroup
                                      .updateImportSchemaCall
                                      .call(
                                authorization: currentAuthenticationToken,
                                schemaId: FFAppState().editedImportSchema.id,
                                schemaJson:
                                    FFAppState().editedImportSchema.toMap(),
                              );

                              if ((_model.schemaUpdateResult?.succeeded ??
                                  true)) {
                                FFAppState().editedImportSchemaAction =
                                    ActionType.UPDATE;
                                context.safePop();
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title:
                                          Text('Błąd w aktualizacji importu! '),
                                      content: Text(
                                          '${ErrorDtoStruct.maybeFromMap((_model.schemaUpdateResult?.jsonBody ?? ''))?.message}'),
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
                              }
                            }

                            safeSetState(() {});
                          },
                          text: 'Zapisz',
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                            borderSide: BorderSide(
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
                Container(
                  constraints: BoxConstraints(
                    minWidth: 250.0,
                    maxWidth: 820.0,
                  ),
                  decoration: BoxDecoration(),
                ),
              ].divide(SizedBox(height: 0.0)),
            ),
          ),
        ),
      ),
    );
  }
}
