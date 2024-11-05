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
  }) : isNew = isNew ?? false;

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

    _model.requiredSwitchValue = FFAppState().editedOfferPart.required;
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
          maxWidth: 700.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Text(
                    'Edycja części menu',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                        constraints: const BoxConstraints(
                          maxWidth: 375.0,
                        ),
                        decoration: const BoxDecoration(),
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
                          SizedBox(
                            width: 150.0,
                            child: TextFormField(
                              controller: _model.basePriceInputTextController,
                              focusNode: _model.basePriceInputFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.basePriceInputTextController',
                                const Duration(milliseconds: 100),
                                () async {
                                  safeSetState(() {
                                    _model.basePriceInputTextController?.text =
                                        functions.replaceCommaWithDot(_model
                                            .basePriceInputTextController
                                            .text)!;
                                    _model.basePriceInputTextController
                                            ?.selection =
                                        TextSelection.collapsed(
                                            offset: _model
                                                .basePriceInputTextController!
                                                .text
                                                .length);
                                  });
                                },
                              ),
                              autofocus: false,
                              readOnly: _model.requiredSwitchValue!,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Cena bazowa',
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
                            options: const ['PLN', 'EUR', 'CZK', 'USD'],
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
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            disabled: _model.requiredSwitchValue!,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ].divide(const SizedBox(width: 20.0)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Czy wzięcie tej części jest wymagane?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Switch.adaptive(
                        value: _model.requiredSwitchValue!,
                        onChanged: (newValue) async {
                          safeSetState(
                              () => _model.requiredSwitchValue = newValue);
                          if (newValue) {
                            safeSetState(() {
                              _model.basePriceInputTextController?.text = '0';
                              _model.basePriceInputTextController?.selection =
                                  TextSelection.collapsed(
                                      offset: _model
                                          .basePriceInputTextController!
                                          .text
                                          .length);
                            });
                          }
                        },
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).primary,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).alternate,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ].divide(const SizedBox(width: 15.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
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
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: const OptionEditWidget(
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
                          icon: const Icon(
                            Icons.add,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 18.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconAlignment: IconAlignment.end,
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Builder(
                    builder: (context) {
                      final options =
                          FFAppState().editedOfferPart.options.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: options.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 1.0),
                        itemBuilder: (context, optionsIndex) {
                          final optionsItem = options[optionsIndex];
                          return Visibility(
                            visible: optionsItem != null,
                            child: Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().editedOption =
                                      functions.cloneOptionObject(optionsItem)!;
                                  FFAppState().editedOptionAction = null;
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: const OptionEditWidget(
                                          isNew: false,
                                        ),
                                      );
                                    },
                                  );

                                  if (FFAppState().editedOptionAction ==
                                      ActionType.UPDATE) {
                                    // Update selected range
                                    FFAppState().updateEditedOfferPartStruct(
                                      (e) => e
                                        ..updateOptions(
                                          (e) => e[optionsIndex] =
                                              FFAppState().editedOption,
                                        ),
                                    );
                                    safeSetState(() {});
                                  } else if (FFAppState().editedOptionAction ==
                                      ActionType.DELETE) {
                                    // Update selected range
                                    FFAppState().updateEditedOfferPartStruct(
                                      (e) => e
                                        ..updateOptions(
                                          (e) => e.removeAt(optionsIndex),
                                        ),
                                    );
                                    safeSetState(() {});
                                  } else if (FFAppState().editedOptionAction ==
                                      ActionType.CREATE) {
                                    // Update selected range
                                    FFAppState().updateEditedOfferPartStruct(
                                      (e) => e
                                        ..updateOptions(
                                          (e) =>
                                              e.add(FFAppState().editedOption),
                                        ),
                                    );
                                    safeSetState(() {});
                                  }

                                  FFAppState().editedOption = OptionStruct();
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
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: true,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                          // Update edited MenuOffer state
                          FFAppState().updateEditedOfferPartStruct(
                            (e) => e
                              ..name = _model.nameInputTextController.text
                              ..required = _model.requiredSwitchValue
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
              ].divide(const SizedBox(height: 0.0)),
            ),
          ),
        ),
      ),
    );
  }
}
