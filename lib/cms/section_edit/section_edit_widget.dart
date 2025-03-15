import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/cms/section_element_edit/section_element_edit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'section_edit_model.dart';
export 'section_edit_model.dart';

class SectionEditWidget extends StatefulWidget {
  const SectionEditWidget({
    super.key,
    bool? isNew,
  }) : this.isNew = isNew ?? false;

  final bool isNew;

  @override
  State<SectionEditWidget> createState() => _SectionEditWidgetState();
}

class _SectionEditWidgetState extends State<SectionEditWidget> {
  late SectionEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionEditModel());

    _model.headerInputTextController ??=
        TextEditingController(text: FFAppState().editedSection.sectionHeader);
    _model.headerInputFocusNode ??= FocusNode();

    _model.subHeaderInputTextController ??= TextEditingController(
        text: FFAppState().editedSection.sectionSubheader);
    _model.subHeaderInputFocusNode ??= FocusNode();

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
          maxWidth: 1000.0,
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Text(
                    'Edycja sekcji',
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 2.0,
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              'Elementy sekcji',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().editedSectionElement =
                                      SectionElementDtoStruct();
                                  FFAppState().editedSectionElementAction =
                                      null;
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: SectionElementEditWidget(
                                          isNew: true,
                                        ),
                                      );
                                    },
                                  );

                                  if (FFAppState().editedSectionElementAction ==
                                      ActionType.CREATE) {
                                    // Add new range
                                    FFAppState().updateEditedSectionStruct(
                                      (e) => e
                                        ..updateSectionElements(
                                          (e) => e.add(FFAppState()
                                              .editedSectionElement),
                                        ),
                                    );
                                    safeSetState(() {});
                                  }
                                  FFAppState().editedSectionElement =
                                      SectionElementDtoStruct();
                                  FFAppState().editedSectionElementAction =
                                      null;
                                },
                                text: 'Dodaj nowy',
                                icon: Icon(
                                  Icons.add,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 18.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconAlignment: IconAlignment.end,
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final sectionElements = FFAppState()
                              .editedSection
                              .sectionElements
                              .toList();

                          return ReorderableListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            proxyDecorator: (Widget child, int index,
                                    Animation<double> animation) =>
                                Material(
                                    color: Colors.transparent, child: child),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: sectionElements.length,
                            itemBuilder: (context, sectionElementsIndex) {
                              final sectionElementsItem =
                                  sectionElements[sectionElementsIndex];
                              return Container(
                                key: ValueKey("ListView_d64cc3hf" +
                                    '_' +
                                    sectionElementsIndex.toString()),
                                child: Visibility(
                                  visible: sectionElementsItem != null,
                                  child: Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().editedSectionElement =
                                              functions
                                                  .cloneSectionElementObject(
                                                      sectionElementsItem)!;
                                          FFAppState()
                                                  .editedSectionElementAction =
                                              null;
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: SectionElementEditWidget(
                                                  isNew: false,
                                                ),
                                              );
                                            },
                                          );

                                          if (FFAppState()
                                                  .editedSectionElementAction ==
                                              ActionType.UPDATE) {
                                            // Update selected range
                                            FFAppState()
                                                .updateEditedSectionStruct(
                                              (e) => e
                                                ..updateSectionElements(
                                                  (e) => e[
                                                          sectionElementsIndex] =
                                                      FFAppState()
                                                          .editedSectionElement,
                                                ),
                                            );
                                            safeSetState(() {});
                                          } else if (FFAppState()
                                                  .editedSectionElementAction ==
                                              ActionType.DELETE) {
                                            // Delete selected range
                                            FFAppState()
                                                .updateEditedSectionStruct(
                                              (e) => e
                                                ..updateSectionElements(
                                                  (e) => e.removeAt(
                                                      sectionElementsIndex),
                                                ),
                                            );
                                            safeSetState(() {});
                                          } else if (FFAppState()
                                                  .editedSectionElementAction ==
                                              ActionType.CREATE) {}

                                          // Clear helper vars
                                          FFAppState().editedSectionElement =
                                              SectionElementDtoStruct();
                                          FFAppState()
                                                  .editedSectionElementAction =
                                              null;
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            title: Text(
                                              sectionElementsItem.header,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              '${sectionElementsItem.subheader} (${sectionElementsItem.elementType}: ${sectionElementsItem.sourceElementId})',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: true,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            onReorder: (int reorderableOldIndex,
                                int reorderableNewIndex) async {
                              FFAppState().updateEditedSectionStruct(
                                (e) => e
                                  ..sectionElements = functions
                                      .swapItemsOfSectionElementList(
                                          FFAppState()
                                              .editedSection
                                              .sectionElements
                                              .toList(),
                                          reorderableOldIndex,
                                          reorderableNewIndex)!
                                      .toList(),
                              );
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                          );
                        },
                      ),
                    ].divide(SizedBox(height: 5.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: Wrap(
                    spacing: 0.0,
                    runSpacing: 15.0,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState().editedSectionAction = null;
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
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
                                FFAppState().editedSectionAction =
                                    ActionType.DELETE;
                                Navigator.pop(context);
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
                          // Update edited MenuOffer state
                          FFAppState().updateEditedSectionStruct(
                            (e) => e
                              ..sectionHeader =
                                  _model.headerInputTextController.text
                              ..sectionSubheader =
                                  _model.subHeaderInputTextController.text,
                          );
                          if (widget.isNew) {
                            FFAppState().editedSectionAction =
                                ActionType.CREATE;
                          } else {
                            FFAppState().editedSectionAction =
                                ActionType.UPDATE;
                          }

                          context.safePop();
                        },
                        text: 'OK',
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                ),
              ].divide(SizedBox(height: 0.0)),
            ),
          ),
        ),
      ),
    );
  }
}
