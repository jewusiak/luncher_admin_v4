import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/cms/section_edit/section_edit_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'page_arrangement_details_model.dart';
export 'page_arrangement_details_model.dart';

class PageArrangementDetailsWidget extends StatefulWidget {
  const PageArrangementDetailsWidget({
    super.key,
    this.arrangementId,
  });

  final String? arrangementId;

  @override
  State<PageArrangementDetailsWidget> createState() =>
      _PageArrangementDetailsWidgetState();
}

class _PageArrangementDetailsWidgetState
    extends State<PageArrangementDetailsWidget> with TickerProviderStateMixin {
  late PageArrangementDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageArrangementDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getArrangementResult =
          await LuncherCoreAPIGETContentManagementArrangementsUuidGroup
              .getArrangementByIdCall
              .call(
        authorization: currentAuthenticationToken,
        uuid: widget.arrangementId,
      );

      if ((_model.getArrangementResult?.succeeded ?? true)) {
        _model.arrangement = PageArrangementDtoStruct.maybeFromMap(
            (_model.getArrangementResult?.jsonBody ?? ''));
        _model.shouldBuild = true;
        safeSetState(() {});
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Błąd'),
              content: const Text('Nie udało się pobrać danych o układzie strony!'),
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
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
                  _model.updateResult =
                      await LuncherCoreAPIPUTContentManagementArrangementsUuidGroup
                          .updateArrangementCall
                          .call(
                    uuid: widget.arrangementId,
                    authorization: currentAuthenticationToken,
                    pageArrangementJson: _model.arrangement?.toMap(),
                  );

                  if ((_model.updateResult?.succeeded ?? true)) {
                    Navigator.pop(context);

                    context.pushNamed(
                      'PageArrangementDetails',
                      queryParameters: {
                        'arrangementId': serializeParam(
                          widget.arrangementId,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Zaaktualizowano!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Nie udało się zaaktualizować układu!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).error,
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
                            text: 'Podgląd',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: Wrap(
                                    spacing: 15.0,
                                    runSpacing: 5.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: _model
                                                .arrangement!.primaryPage
                                            ? null
                                            : () async {
                                                _model.apiResultxmv =
                                                    await LuncherCoreAPIPUTContentManagementArrangementsUuidPrimaryGroup
                                                        .makeArrangementPrimaryCall
                                                        .call(
                                                  uuid: widget.arrangementId,
                                                  authorization:
                                                      currentAuthenticationToken,
                                                );

                                                if ((_model.apiResultxmv
                                                        ?.succeeded ??
                                                    true)) {
                                                  _model
                                                      .updateArrangementStruct(
                                                    (e) =>
                                                        e..primaryPage = true,
                                                  );
                                                  safeSetState(() {});
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Ta strona jest teraz włączona!',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Nie udało się przełączyć strony!',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                        text: 'Uaktywnij stronę',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
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
                                                  .accent4,
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().editedSection =
                                                SectionDtoStruct();
                                            FFAppState().editedSectionAction =
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
                                                      const AlignmentDirectional(
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
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: const SectionEditWidget(
                                                      isNew: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            if (FFAppState()
                                                    .editedSectionAction ==
                                                ActionType.UPDATE) {
                                            } else if (FFAppState()
                                                    .editedSectionAction ==
                                                ActionType.DELETE) {
                                            } else if (FFAppState()
                                                    .editedSectionAction ==
                                                ActionType.CREATE) {
                                              // Add new range
                                              _model.updateArrangementStruct(
                                                (e) => e
                                                  ..updateSections(
                                                    (e) => e.add(FFAppState()
                                                        .editedSection),
                                                  ),
                                              );
                                              safeSetState(() {});
                                            }

                                            // Clear helper vars
                                            FFAppState().editedSection =
                                                SectionDtoStruct();
                                            FFAppState().editedSectionAction =
                                                null;
                                          },
                                          text: 'Dodaj sekcję',
                                          icon: const Icon(
                                            Icons.add,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
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
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 700.0,
                                    ),
                                    decoration: const BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final sections = _model
                                                .arrangement?.sections
                                                .toList() ??
                                            [];

                                        return ReorderableListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: sections.length,
                                          itemBuilder:
                                              (context, sectionsIndex) {
                                            final sectionsItem =
                                                sections[sectionsIndex];
                                            return Container(
                                              key: ValueKey(
                                                  "ListView_aztlnwbg" '_' +
                                                      sectionsIndex.toString()),
                                              child: Visibility(
                                                visible: sectionsItem != null,
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
                                                              .editedSection =
                                                          functions
                                                              .cloneSectionObject(
                                                                  sectionsItem)!;
                                                      FFAppState()
                                                              .editedSectionAction =
                                                          null;
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
                                                                  const SectionEditWidget(
                                                                isNew: false,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      if (FFAppState()
                                                              .editedSectionAction ==
                                                          ActionType.UPDATE) {
                                                        // Update selected range
                                                        _model
                                                            .updateArrangementStruct(
                                                          (e) => e
                                                            ..updateSections(
                                                              (e) => e[
                                                                      sectionsIndex] =
                                                                  FFAppState()
                                                                      .editedSection,
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                      } else if (FFAppState()
                                                              .editedSectionAction ==
                                                          ActionType.DELETE) {
                                                        // Delete selected range
                                                        _model
                                                            .updateArrangementStruct(
                                                          (e) => e
                                                            ..updateSections(
                                                              (e) => e.removeAt(
                                                                  sectionsIndex),
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                      } else if (FFAppState()
                                                              .editedSectionAction ==
                                                          ActionType.CREATE) {
                                                        // Add new range
                                                        _model
                                                            .updateArrangementStruct(
                                                          (e) => e
                                                            ..updateSections(
                                                              (e) => e.add(
                                                                  FFAppState()
                                                                      .editedSection),
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                      }

                                                      // Clear helper vars
                                                      FFAppState()
                                                              .editedSection =
                                                          SectionDtoStruct();
                                                      FFAppState()
                                                              .editedSectionAction =
                                                          null;
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: ListTile(
                                                        title: Text(
                                                          sectionsItem
                                                              .sectionHeader,
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
                                                          '${sectionsItem.sectionSubheader} (${sectionsItem.sectionElements.length.toString()} elem.)',
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
                                              ),
                                            );
                                          },
                                          onReorder: (int reorderableOldIndex,
                                              int reorderableNewIndex) async {
                                            _model.updateArrangementStruct(
                                              (e) => e
                                                ..sections = functions
                                                    .swapItemsOfSectionList(
                                                        _model.arrangement
                                                            ?.sections
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
                                  ),
                                ),
                              ].divide(const SizedBox(height: 20.0)),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Loading',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
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
