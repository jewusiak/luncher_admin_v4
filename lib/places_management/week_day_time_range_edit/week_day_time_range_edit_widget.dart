import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'week_day_time_range_edit_model.dart';
export 'week_day_time_range_edit_model.dart';

class WeekDayTimeRangeEditWidget extends StatefulWidget {
  const WeekDayTimeRangeEditWidget({
    super.key,
    bool? isNew,
  }) : this.isNew = isNew ?? false;

  final bool isNew;

  @override
  State<WeekDayTimeRangeEditWidget> createState() =>
      _WeekDayTimeRangeEditWidgetState();
}

class _WeekDayTimeRangeEditWidgetState
    extends State<WeekDayTimeRangeEditWidget> {
  late WeekDayTimeRangeEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeekDayTimeRangeEditModel());

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
          maxWidth: 440.0,
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
                'Edycja zakresu',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Start',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.startDayDDValueController ??=
                        FormFieldController<String>(
                      _model.startDayDDValue ??=
                          FFAppState().editedWeekDayTimeRange.startTime.day,
                    ),
                    options: List<String>.from([
                      'MONDAY',
                      'TUESDAY',
                      'WEDNESDAY',
                      'THURSDAY',
                      'FRIDAY',
                      'SATURDAY',
                      'SUNDAY'
                    ]),
                    optionLabels: [
                      'Poniedziałek',
                      'Wtorek',
                      'Środa',
                      'Czwartek',
                      'Piątek',
                      'Sobota',
                      'Niedziela'
                    ],
                    onChanged: (val) async {
                      safeSetState(() => _model.startDayDDValue = val);
                      safeSetState(() {
                        _model.endDayDDValueController?.value =
                            _model.startDayDDValue!;
                      });
                      FFAppState().updateEditedWeekDayTimeRangeStruct(
                        (e) => e
                          ..updateStartTime(
                            (e) => e..day = _model.startDayDDValue,
                          ),
                      );
                      safeSetState(() {});
                    },
                    width: 200.0,
                    height: 40.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Dzień tygodnia',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      _model.startTimePicker = await actions.show24hTimePicker(
                        context,
                        FFAppState().editedWeekDayTimeRange.startTime.time,
                      );
                      FFAppState().updateEditedWeekDayTimeRangeStruct(
                        (e) => e
                          ..updateStartTime(
                            (e) => e..time = _model.startTimePicker,
                          ),
                      );
                      safeSetState(() {});

                      safeSetState(() {});
                    },
                    text: FFAppState().editedWeekDayTimeRange.startTime.time,
                    icon: Icon(
                      Icons.access_time_outlined,
                      size: 18.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Koniec',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.endDayDDValueController ??=
                        FormFieldController<String>(
                      _model.endDayDDValue ??=
                          FFAppState().editedWeekDayTimeRange.endTime.day,
                    ),
                    options: List<String>.from([
                      'MONDAY',
                      'TUESDAY',
                      'WEDNESDAY',
                      'THURSDAY',
                      'FRIDAY',
                      'SATURDAY',
                      'SUNDAY'
                    ]),
                    optionLabels: [
                      'Poniedziałek',
                      'Wtorek',
                      'Środa',
                      'Czwartek',
                      'Piątek',
                      'Sobota',
                      'Niedziela'
                    ],
                    onChanged: (val) async {
                      safeSetState(() => _model.endDayDDValue = val);
                      FFAppState().updateEditedWeekDayTimeRangeStruct(
                        (e) => e
                          ..updateEndTime(
                            (e) => e..day = _model.endDayDDValue,
                          ),
                      );
                      safeSetState(() {});
                    },
                    width: 200.0,
                    height: 40.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Dzień tygodnia',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      _model.endTimePicker = await actions.show24hTimePicker(
                        context,
                        FFAppState().editedWeekDayTimeRange.endTime.time,
                      );
                      FFAppState().updateEditedWeekDayTimeRangeStruct(
                        (e) => e
                          ..updateEndTime(
                            (e) => e..time = _model.endTimePicker,
                          ),
                      );
                      safeSetState(() {});

                      safeSetState(() {});
                    },
                    text: FFAppState().editedWeekDayTimeRange.endTime.time,
                    icon: Icon(
                      Icons.access_time_outlined,
                      size: 18.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      FFAppState().editedWeekDayTimeRangeAction = null;
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
                    onPressed: widget.isNew
                        ? null
                        : () async {
                            FFAppState().editedWeekDayTimeRangeAction =
                                ActionType.DELETE;
                            Navigator.pop(context);
                          },
                    text: 'Usuń',
                    options: FFButtonOptions(
                      width: 100.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).error,
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
                      disabledColor: Color(0xFFE9E9E9),
                      disabledTextColor:
                          FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      if (widget.isNew) {
                        FFAppState().editedWeekDayTimeRangeAction =
                            ActionType.CREATE;
                      } else {
                        FFAppState().editedWeekDayTimeRangeAction =
                            ActionType.UPDATE;
                      }

                      context.safePop();
                    },
                    text: 'OK',
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
