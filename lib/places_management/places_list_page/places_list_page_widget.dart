import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/places_management/create_place_dialog/create_place_dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'places_list_page_model.dart';
export 'places_list_page_model.dart';

class PlacesListPageWidget extends StatefulWidget {
  const PlacesListPageWidget({super.key});

  @override
  State<PlacesListPageWidget> createState() => _PlacesListPageWidgetState();
}

class _PlacesListPageWidgetState extends State<PlacesListPageWidget> {
  late PlacesListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlacesListPageModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    _model.ownerTextFieldTextController ??= TextEditingController();

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
            'Lokale',
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: 350.0,
                        child: TextFormField(
                          controller: _model.searchFieldTextController,
                          focusNode: _model.searchFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchFieldTextController',
                            const Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Wyszukaj...',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            suffixIcon: _model
                                    .searchFieldTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.searchFieldTextController?.clear();
                                      safeSetState(() {});
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      size: 20.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.searchFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      FutureBuilder<ApiCallResponse>(
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
                              _model.placeTypeSelectorValue ??=
                                  FFAppConstants.nullvalue,
                            ),
                            options: List<String>.from(
                                functions.concatStringWithList(
                                    FFAppConstants.nullvalue,
                                    (placeTypeSelectorGetAllPlaceTypesResponse
                                                .jsonBody
                                                .toList()
                                                .map<PlaceTypeStruct?>(
                                                    PlaceTypeStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<PlaceTypeStruct?>)
                                        .withoutNulls
                                        .map((e) => e.identifier)
                                        .toList())),
                            optionLabels: functions.concatStringWithList(
                                '---',
                                (placeTypeSelectorGetAllPlaceTypesResponse
                                        .jsonBody
                                        .toList()
                                        .map<PlaceTypeStruct?>(
                                            PlaceTypeStruct.maybeFromMap)
                                        .toList() as Iterable<PlaceTypeStruct?>)
                                    .withoutNulls
                                    .map((e) => e.name)
                                    .toList()),
                            onChanged: (val) => safeSetState(
                                () => _model.placeTypeSelectorValue = val),
                            width: 200.0,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            hintText: '---',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                      ),
                      FlutterFlowDropDown<String>(
                        controller:
                            _model.placeEnabledSelectorValueController ??=
                                FormFieldController<String>(
                          _model.placeEnabledSelectorValue ??= 'null',
                        ),
                        options: List<String>.from(['null', 'true', 'false']),
                        optionLabels: const ['Wł/wył', 'Włączone', 'Wyłączone'],
                        onChanged: (val) => safeSetState(
                            () => _model.placeEnabledSelectorValue = val),
                        width: 200.0,
                        height: 40.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Wł/wył',
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
                      SizedBox(
                        width: 200.0,
                        child: Autocomplete<String>(
                          initialValue: const TextEditingValue(),
                          optionsBuilder: (textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return _model.owners
                                .map((e) => e.email)
                                .toList()
                                .where((option) {
                              final lowercaseOption = option.toLowerCase();
                              return lowercaseOption.contains(
                                  textEditingValue.text.toLowerCase());
                            });
                          },
                          optionsViewBuilder: (context, onSelected, options) {
                            return AutocompleteOptionsList(
                              textFieldKey: _model.ownerTextFieldKey,
                              textController:
                                  _model.ownerTextFieldTextController!,
                              options: options.toList(),
                              onSelected: onSelected,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              textHighlightStyle: const TextStyle(),
                              elevation: 4.0,
                              optionBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              optionHighlightColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              maxHeight: 200.0,
                            );
                          },
                          onSelected: (String selection) {
                            safeSetState(() => _model
                                .ownerTextFieldSelectedOption = selection);
                            FocusScope.of(context).unfocus();
                          },
                          fieldViewBuilder: (
                            context,
                            textEditingController,
                            focusNode,
                            onEditingComplete,
                          ) {
                            _model.ownerTextFieldFocusNode = focusNode;

                            _model.ownerTextFieldTextController =
                                textEditingController;
                            return TextFormField(
                              key: _model.ownerTextFieldKey,
                              controller: textEditingController,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.ownerTextFieldTextController',
                                const Duration(milliseconds: 500),
                                () async {
                                  var shouldSetState = false;
                                  _model.ownersSearchResult =
                                      await LuncherCoreAPIGETUsersSearchGroup
                                          .adminSearchUsersCall
                                          .call(
                                    authorization: currentAuthenticationToken,
                                    query: _model
                                        .ownerTextFieldTextController.text,
                                    size: 10,
                                    page: 0,
                                  );

                                  shouldSetState = true;
                                  if ((_model.ownersSearchResult?.succeeded ??
                                      true)) {
                                    _model.owners = ((_model.ownersSearchResult
                                                    ?.jsonBody ??
                                                '')
                                            .toList()
                                            .map<UserStruct?>(
                                                UserStruct.maybeFromMap)
                                            .toList() as Iterable<UserStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<UserStruct>();
                                    safeSetState(() {});
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Nie udało się pobrać właścieli',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                      ),
                                    );
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (shouldSetState) safeSetState(() {});
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Wybierz właściciela...',
                                hintStyle: FlutterFlowTheme.of(context)
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                suffixIcon: _model.ownerTextFieldTextController!
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.ownerTextFieldTextController
                                              ?.clear();
                                          var shouldSetState = false;
                                          _model.ownersSearchResult =
                                              await LuncherCoreAPIGETUsersSearchGroup
                                                  .adminSearchUsersCall
                                                  .call(
                                            authorization:
                                                currentAuthenticationToken,
                                            query: _model
                                                .ownerTextFieldTextController
                                                .text,
                                            size: 10,
                                            page: 0,
                                          );

                                          shouldSetState = true;
                                          if ((_model.ownersSearchResult
                                                  ?.succeeded ??
                                              true)) {
                                            _model.owners =
                                                ((_model.ownersSearchResult
                                                                    ?.jsonBody ??
                                                                '')
                                                            .toList()
                                                            .map<UserStruct?>(
                                                                UserStruct
                                                                    .maybeFromMap)
                                                            .toList()
                                                        as Iterable<
                                                            UserStruct?>)
                                                    .withoutNulls
                                                    .toList()
                                                    .cast<UserStruct>();
                                            safeSetState(() {});
                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Nie udało się pobrać właścieli',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
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
                                          safeSetState(() {});
                                        },
                                        child: const Icon(
                                          Icons.clear,
                                          size: 15.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              keyboardType: TextInputType.emailAddress,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .ownerTextFieldTextControllerValidator
                                  .asValidator(context),
                            );
                          },
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 45.0,
                        borderWidth: 1.0,
                        buttonSize: 45.0,
                        fillColor: FlutterFlowTheme.of(context).accent1,
                        icon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          safeSetState(() =>
                              _model.placesListViewPagingController?.refresh());
                        },
                      ),
                      Builder(
                        builder: (context) => FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 45.0,
                          borderWidth: 1.0,
                          buttonSize: 45.0,
                          fillColor: FlutterFlowTheme.of(context).accent1,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(dialogContext).unfocus(),
                                    child: const CreatePlaceDialogWidget(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async {
                    safeSetState(
                        () => _model.placesListViewPagingController?.refresh());
                  },
                  child: PagedListView<ApiPagingParams, dynamic>(
                    pagingController: _model.setPlacesListViewController(
                      (nextPageMarker) => LuncherCoreAPIPOSTPlaceSearchGroup
                          .searchQueryCall
                          .call(
                        authorization: currentAuthenticationToken,
                        textQuery:
                            _model.searchFieldTextController.text == ''
                                ? FFAppConstants.nullvalue
                                : _model.searchFieldTextController.text,
                        placeTypeIdentifier: _model.placeTypeSelectorValue,
                        page: nextPageMarker.nextPageNumber,
                        size: 10,
                        enabled: () {
                          if (_model.placeEnabledSelectorValue == 'true') {
                            return true;
                          } else if (_model.placeEnabledSelectorValue ==
                              'false') {
                            return false;
                          } else {
                            return null;
                          }
                        }()
                            ?.toString(),
                        ownerEmail: _model.ownerTextFieldTextController.text == ''
                            ? FFAppConstants.nullvalue
                            : _model.ownerTextFieldTextController.text,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<dynamic>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ),
                      // Customize what your widget looks like when it's loading another page.
                      newPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, placesListIndex) {
                        final placesListItem = _model
                            .placesListViewPagingController!
                            .itemList![placesListIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'PlaceDetailsPage',
                              queryParameters: {
                                'placeId': serializeParam(
                                  placesListItem.id,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );

                            safeSetState(() => _model
                                .placesListViewPagingController
                                ?.refresh());
                            await _model.waitForOnePageForPlacesListView();
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: Icon(
                                Icons.check,
                                color: placesListItem.enabled
                                    ? const Color(0xFF29DF3F)
                                    : Colors.transparent,
                                size: 30.0,
                              ),
                              title: Text(
                                '${placesListItem.name} (${placesListItem.longName})',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              subtitle: Text(
                                '${placesListItem.address.firstLine}, ${placesListItem.address.district}, ${placesListItem.address.city}',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              dense: false,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
