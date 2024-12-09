import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'cms_list_page_model.dart';
export 'cms_list_page_model.dart';

class CmsListPageWidget extends StatefulWidget {
  const CmsListPageWidget({super.key});

  @override
  State<CmsListPageWidget> createState() => _CmsListPageWidgetState();
}

class _CmsListPageWidgetState extends State<CmsListPageWidget> {
  late CmsListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CmsListPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
            'CMS - lista układów',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 40.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        _model.createResult =
                            await LuncherCoreAPIPOSTContentManagementArrangementsGroup
                                .createArrangementCall
                                .call(
                          authorization: currentAuthenticationToken,
                        );

                        if ((_model.createResult?.succeeded ?? true)) {
                          context.pushNamed(
                            'PageArrangementDetails',
                            queryParameters: {
                              'arrangementId': serializeParam(
                                PageArrangementDtoStruct.maybeFromMap(
                                        (_model.createResult?.jsonBody ?? ''))
                                    ?.id,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );

                          safeSetState(() => _model.apiRequestCompleter = null);
                          await _model.waitForApiRequestCompleted();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Nie udało się stworzyć nowego układu!',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 700.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter ??= Completer<
                                  ApiCallResponse>()
                                ..complete(
                                    LuncherCoreAPIGETContentManagementArrangementsGroup
                                        .getAllArrangementsCall
                                        .call(
                                  authorization: currentAuthenticationToken,
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final listViewGetAllArrangementsResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final arrs = (listViewGetAllArrangementsResponse
                                                .jsonBody
                                                .toList()
                                                .map<PageArrangementDtoStruct?>(
                                                    PageArrangementDtoStruct
                                                        .maybeFromMap)
                                                .toList()
                                            as Iterable<
                                                PageArrangementDtoStruct?>)
                                        .withoutNulls
                                        .toList() ??
                                    [];

                                return RefreshIndicator(
                                  onRefresh: () async {
                                    safeSetState(() =>
                                        _model.apiRequestCompleter = null);
                                    await _model.waitForApiRequestCompleted();
                                  },
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: arrs.length,
                                    itemBuilder: (context, arrsIndex) {
                                      final arrsItem = arrs[arrsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'PageArrangementDetails',
                                            queryParameters: {
                                              'arrangementId': serializeParam(
                                                arrsItem.id,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          safeSetState(() => _model
                                              .apiRequestCompleter = null);
                                          await _model
                                              .waitForApiRequestCompleted();
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.check,
                                              color: arrsItem.primaryPage
                                                  ? const Color(0xFF319624)
                                                  : Colors.transparent,
                                              size: 32.0,
                                            ),
                                            title: Text(
                                              arrsItem.id,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
