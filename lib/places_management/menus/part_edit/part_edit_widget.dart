import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/places_management/menus/option_edit/option_edit_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'part_edit_model.dart';
export 'part_edit_model.dart';

class PartEditWidget extends StatefulWidget {
  const PartEditWidget({
    super.key,
    bool? isNew,
  }) : this.isNew = isNew ?? false;

  final bool isNew;

  @override
  State<PartEditWidget> createState() => _PartEditWidgetState();
}

class _PartEditWidgetState extends State<PartEditWidget> {
  late PartEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartEditModel());

    _model.nameInputTextController ??=
        TextEditingController(text: FFAppState().editedOfferPart.name);
    _model.nameInputFocusNode ??= FocusNode();

    _model.basePriceInputTextController ??= TextEditingController(
        text: FFAppState().editedOfferPart.supplement.amount.toString());
    _model.basePriceInputFocusNode ??= FocusNode();

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
          maxWidth: 700.0,
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
                    'Edycja części menu',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 375.0,
                        ),
                        decoration: BoxDecoration(),
                        child: TextFormField(
                          controller: _model.nameInputTextController,
                          focusNode: _model.nameInputFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Nazwa',
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
                          validator: _model.nameInputTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 150.0,
                            child: TextFormField(
                              controller: _model.basePriceInputTextController,
                              focusNode: _model.basePriceInputFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.basePriceInputTextController',
                                Duration(milliseconds: 100),
                                () async {
                                  safeSetState(() {
                                    _model.basePriceInputTextController?.text =
                                        functions.replaceCommaWithDot(_model
                                            .basePriceInputTextController
                                            .text)!;
                                  });
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Dopłata',
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
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .basePriceInputTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          FlutterFlowDropDown<String>(
                            controller: _model.ccyDropDownValueController ??=
                                FormFieldController<String>(
                              _model.ccyDropDownValue ??= FFAppState()
                                  .editedOfferPart
                                  .supplement
                                  .currencyCode,
                            ),
                            options: ['PLN', 'EUR', 'CZK', 'USD'],
                            onChanged: (val) => safeSetState(
                                () => _model.ccyDropDownValue = val),
                            width: 100.0,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Waluta',
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
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ].divide(SizedBox(width: 20.0)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
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
                        'Opcje do wyboru ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            FFAppState().editedOption = OptionStruct();
                            FFAppState().editedOptionAction = null;
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: OptionEditWidget(
                                    isNew: true,
                                  ),
                                );
                              },
                            );

                            if (FFAppState().editedOptionAction ==
                                ActionType.CREATE) {
                              // Add new range
                              FFAppState().updateEditedOfferPartStruct(
                                (e) => e
                                  ..updateOptions(
                                    (e) => e.add(FFAppState().editedOption),
                                  ),
                              );
                              safeSetState(() {});
                            }
                            FFAppState().editedOption = OptionStruct();
                            FFAppState().editedOptionAction = null;
                          },
                          text: 'Dodaj nową',
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Builder(
                    builder: (context) {
                      final options =
                          FFAppState().editedOfferPart.options.toList();

                      return ReorderableListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        proxyDecorator: (Widget child, int index,
                                Animation<double> animation) =>
                            Material(color: Colors.transparent, child: child),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: options.length,
                        itemBuilder: (context, optionsIndex) {
                          final optionsItem = options[optionsIndex];
                          return Container(
                            key: ValueKey("ListView_iwhuznsq" +
                                '_' +
                                optionsIndex.toString()),
                            child: Visibility(
                              visible: optionsItem != null,
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
                                      FFAppState().editedOption = functions
                                          .cloneOptionObject(optionsItem)!;
                                      FFAppState().editedOptionAction = null;
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: OptionEditWidget(
                                              isNew: false,
                                            ),
                                          );
                                        },
                                      );

                                      if (FFAppState().editedOptionAction ==
                                          ActionType.UPDATE) {
                                        // Update selected range
                                        FFAppState()
                                            .updateEditedOfferPartStruct(
                                          (e) => e
                                            ..updateOptions(
                                              (e) => e[optionsIndex] =
                                                  FFAppState().editedOption,
                                            ),
                                        );
                                        safeSetState(() {});
                                      } else if (FFAppState()
                                              .editedOptionAction ==
                                          ActionType.DELETE) {
                                        // Update selected range
                                        FFAppState()
                                            .updateEditedOfferPartStruct(
                                          (e) => e
                                            ..updateOptions(
                                              (e) => e.removeAt(optionsIndex),
                                            ),
                                        );
                                        safeSetState(() {});
                                      } else if (FFAppState()
                                              .editedOptionAction ==
                                          ActionType.CREATE) {
                                        // Update selected range
                                        FFAppState()
                                            .updateEditedOfferPartStruct(
                                          (e) => e
                                            ..updateOptions(
                                              (e) => e.add(
                                                  FFAppState().editedOption),
                                            ),
                                        );
                                        safeSetState(() {});
                                      }

                                      FFAppState().editedOption =
                                          OptionStruct();
                                      FFAppState().editedOptionAction = null;
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        title: Text(
                                          optionsItem.name,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        subtitle: Text(
                                          'Dopłata: ${valueOrDefault<String>(
                                            optionsItem.supplement.amount
                                                .toString(),
                                            '0.00',
                                          )} ${optionsItem.supplement.currencyCode}',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
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
                          FFAppState().updateEditedOfferPartStruct(
                            (e) => e
                              ..options = functions
                                  .swapItemsOfOptionsList(
                                      FFAppState()
                                          .editedOfferPart
                                          .options
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
                          FFAppState().editedOfferPartAction = null;
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
                                FFAppState().editedOfferPartAction =
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
                          FFAppState().updateEditedOfferPartStruct(
                            (e) => e
                              ..name = _model.nameInputTextController.text
                              ..supplement = MonetaryAmountStruct(
                                amount: double.tryParse(
                                    _model.basePriceInputTextController.text),
                                currencyCode: _model.ccyDropDownValue,
                              ),
                          );
                          if (widget.isNew) {
                            FFAppState().editedOfferPartAction =
                                ActionType.CREATE;
                          } else {
                            FFAppState().editedOfferPartAction =
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
