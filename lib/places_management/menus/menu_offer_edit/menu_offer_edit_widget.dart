import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/places_management/local_date_time_range_edit/local_date_time_range_edit_widget.dart';
import '/places_management/menus/part_edit/part_edit_widget.dart';
import '/places_management/week_day_time_range_edit/week_day_time_range_edit_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_offer_edit_model.dart';
export 'menu_offer_edit_model.dart';

class MenuOfferEditWidget extends StatefulWidget {
  const MenuOfferEditWidget({
    super.key,
    bool? isNew,
  }) : isNew = isNew ?? false;

  final bool isNew;

  @override
  State<MenuOfferEditWidget> createState() => _MenuOfferEditWidgetState();
}

class _MenuOfferEditWidgetState extends State<MenuOfferEditWidget> {
  late MenuOfferEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuOfferEditModel());

    _model.nameInputTextController ??=
        TextEditingController(text: FFAppState().editedMenuOffer.name);
    _model.nameInputFocusNode ??= FocusNode();

    _model.basePriceInputTextController ??= TextEditingController(
        text: FFAppState().editedMenuOffer.basePrice.amount.toString());
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Text(
                    'Edycja oferty menu',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
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
                          maxWidth: 600.0,
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
                                const Duration(milliseconds: 2000),
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
                              _model.ccyDropDownValue ??=
                                  valueOrDefault<String>(
                                FFAppState()
                                    .editedMenuOffer
                                    .basePrice
                                    .currencyCode,
                                'PLN',
                              ),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Wrap(
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
                            'Części oferty menu',
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
                                FFAppState().editedOfferPart = PartStruct(
                                  required: false,
                                );
                                FFAppState().editedOfferPartAction = null;
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: const PartEditWidget(
                                        isNew: true,
                                      ),
                                    );
                                  },
                                );

                                if (FFAppState().editedOfferPartAction ==
                                    ActionType.CREATE) {
                                  // Add new range
                                  FFAppState().updateEditedMenuOfferStruct(
                                    (e) => e
                                      ..updateParts(
                                        (e) =>
                                            e.add(FFAppState().editedOfferPart),
                                      ),
                                  );
                                  safeSetState(() {});
                                }
                                FFAppState().editedOfferPart = PartStruct();
                                FFAppState().editedOfferPartAction = null;
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
                      Builder(
                        builder: (context) {
                          final parts =
                              FFAppState().editedMenuOffer.parts.toList();

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: parts.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 1.0),
                            itemBuilder: (context, partsIndex) {
                              final partsItem = parts[partsIndex];
                              return Visibility(
                                visible: partsItem != null,
                                child: Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().editedOfferPart =
                                          functions.clonePartObject(partsItem)!;
                                      FFAppState().editedOfferPartAction = null;
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: const PartEditWidget(
                                              isNew: false,
                                            ),
                                          );
                                        },
                                      );

                                      if (FFAppState().editedOfferPartAction ==
                                          ActionType.UPDATE) {
                                        // Update selected range
                                        FFAppState()
                                            .updateEditedMenuOfferStruct(
                                          (e) => e
                                            ..updateParts(
                                              (e) => e[partsIndex] =
                                                  FFAppState().editedOfferPart,
                                            ),
                                        );
                                        safeSetState(() {});
                                      } else if (FFAppState()
                                              .editedOfferPartAction ==
                                          ActionType.DELETE) {
                                        // Update selected range
                                        FFAppState()
                                            .updateEditedMenuOfferStruct(
                                          (e) => e
                                            ..updateParts(
                                              (e) => e.removeAt(partsIndex),
                                            ),
                                        );
                                        safeSetState(() {});
                                      } else if (FFAppState()
                                              .editedOfferPartAction ==
                                          ActionType.CREATE) {
                                        // Update selected range
                                        FFAppState()
                                            .updateEditedMenuOfferStruct(
                                          (e) => e
                                            ..updateParts(
                                              (e) => e.add(
                                                  FFAppState().editedOfferPart),
                                            ),
                                        );
                                        safeSetState(() {});
                                      }

                                      FFAppState().editedOfferPart =
                                          PartStruct();
                                      FFAppState().editedOfferPartAction = null;
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      child: ListTile(
                                        title: Text(
                                          partsItem.name,
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
                                            partsItem.supplement.amount
                                                .toString(),
                                            '0.00',
                                          )} ${partsItem.supplement.currencyCode}',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                    ].divide(const SizedBox(height: 5.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Wrap(
                    spacing: 0.0,
                    runSpacing: 20.0,
                    alignment: WrapAlignment.spaceAround,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 450.0,
                        ),
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Wrap(
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
                                  'Powtarzający się czas obowiązywania',
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
                                      FFAppState().editedWeekDayTimeRange =
                                          WeekDayTimeRangeStruct(
                                        startTime: WeekDayTimeStruct(
                                          time: '12:00',
                                          day: 'MONDAY',
                                        ),
                                        endTime: WeekDayTimeStruct(
                                          time: '15:00',
                                          day: 'MONDAY',
                                        ),
                                      );
                                      FFAppState()
                                          .editedWeekDayTimeRangeAction = null;
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: const WeekDayTimeRangeEditWidget(
                                              isNew: true,
                                            ),
                                          );
                                        },
                                      );

                                      if (FFAppState()
                                              .editedWeekDayTimeRangeAction ==
                                          ActionType.CREATE) {
                                        // Add new range
                                        FFAppState()
                                            .updateEditedMenuOfferStruct(
                                          (e) => e
                                            ..updateRecurringServingRanges(
                                              (e) => e.add(FFAppState()
                                                  .editedWeekDayTimeRange),
                                            ),
                                        );
                                        safeSetState(() {});
                                      }
                                      // Clear helper vars
                                      FFAppState().editedWeekDayTimeRange =
                                          WeekDayTimeRangeStruct();
                                      FFAppState()
                                          .editedWeekDayTimeRangeAction = null;
                                    },
                                    text: 'Dodaj nowy',
                                    icon: const Icon(
                                      Icons.add,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 18.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconAlignment: IconAlignment.end,
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                            Builder(
                              builder: (context) {
                                final openingWindows = FFAppState()
                                    .editedMenuOffer
                                    .recurringServingRanges
                                    .toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: openingWindows.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 1.0),
                                  itemBuilder: (context, openingWindowsIndex) {
                                    final openingWindowsItem =
                                        openingWindows[openingWindowsIndex];
                                    return Visibility(
                                      visible: openingWindowsItem.startTime.time !=
                                              '',
                                      child: Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState()
                                                    .editedWeekDayTimeRange =
                                                WeekDayTimeRangeStruct(
                                              startTime: WeekDayTimeStruct(
                                                time: openingWindowsItem
                                                    .startTime.time,
                                                day: openingWindowsItem
                                                    .startTime.day,
                                              ),
                                              endTime: WeekDayTimeStruct(
                                                time: openingWindowsItem
                                                    .endTime.time,
                                                day: openingWindowsItem
                                                    .endTime.day,
                                              ),
                                            );
                                            FFAppState()
                                                    .editedWeekDayTimeRangeAction =
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
                                                  child:
                                                      const WeekDayTimeRangeEditWidget(),
                                                );
                                              },
                                            );

                                            if (FFAppState()
                                                    .editedWeekDayTimeRangeAction ==
                                                ActionType.UPDATE) {
                                              // Update selected range
                                              FFAppState()
                                                  .updateEditedMenuOfferStruct(
                                                (e) => e
                                                  ..updateRecurringServingRanges(
                                                    (e) => e[
                                                            openingWindowsIndex] =
                                                        FFAppState()
                                                            .editedWeekDayTimeRange,
                                                  ),
                                              );
                                              safeSetState(() {});
                                            } else if (FFAppState()
                                                    .editedWeekDayTimeRangeAction ==
                                                ActionType.DELETE) {
                                              // Update selected range
                                              FFAppState()
                                                  .updateEditedMenuOfferStruct(
                                                (e) => e
                                                  ..updateRecurringServingRanges(
                                                    (e) => e.removeAt(
                                                        openingWindowsIndex),
                                                  ),
                                              );
                                              safeSetState(() {});
                                            } else if (FFAppState()
                                                    .editedWeekDayTimeRangeAction ==
                                                ActionType.CREATE) {
                                              // Update selected range
                                              FFAppState()
                                                  .updateEditedMenuOfferStruct(
                                                (e) => e
                                                  ..updateRecurringServingRanges(
                                                    (e) => e.add(FFAppState()
                                                        .editedWeekDayTimeRange),
                                                  ),
                                              );
                                              safeSetState(() {});
                                            }

                                            // Clear helper vars
                                            FFAppState()
                                                    .editedWeekDayTimeRange =
                                                WeekDayTimeRangeStruct();
                                            FFAppState()
                                                    .editedWeekDayTimeRangeAction =
                                                null;
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                '${functions.dayOfWeekEnumToPolishName(openingWindowsItem.startTime.day)}, ${openingWindowsItem.startTime.time} - ${openingWindowsItem.startTime.day == openingWindowsItem.endTime.day ? '' : '${functions.dayOfWeekEnumToPolishName(openingWindowsItem.endTime.day)}, '}${openingWindowsItem.endTime.time}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: true,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                          ].divide(const SizedBox(height: 5.0)),
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 450.0,
                        ),
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Wrap(
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
                                  'Jednorazowe okresy obowiązywania',
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
                                      FFAppState().editedLocalDateTimeRange =
                                          LocalDateTimeRangeStruct();
                                      FFAppState()
                                              .editedLocalDateTimeRangeAction =
                                          null;
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: const LocalDateTimeRangeEditWidget(
                                              isNew: true,
                                            ),
                                          );
                                        },
                                      );

                                      if (FFAppState()
                                              .editedLocalDateTimeRangeAction ==
                                          ActionType.CREATE) {
                                        // Add new range
                                        FFAppState()
                                            .updateEditedMenuOfferStruct(
                                          (e) => e
                                            ..updateOneTimeServingRanges(
                                              (e) => e.add(FFAppState()
                                                  .editedLocalDateTimeRange),
                                            ),
                                        );
                                        safeSetState(() {});
                                      }
                                      // Clear helper vars
                                      FFAppState().editedLocalDateTimeRange =
                                          LocalDateTimeRangeStruct();
                                      FFAppState()
                                              .editedLocalDateTimeRangeAction =
                                          null;
                                    },
                                    text: 'Dodaj nowy',
                                    icon: const Icon(
                                      Icons.add,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 18.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconAlignment: IconAlignment.end,
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                            Builder(
                              builder: (context) {
                                final openingWindows = FFAppState()
                                    .editedMenuOffer
                                    .oneTimeServingRanges
                                    .toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: openingWindows.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 1.0),
                                  itemBuilder: (context, openingWindowsIndex) {
                                    final openingWindowsItem =
                                        openingWindows[openingWindowsIndex];
                                    return Visibility(
                                      visible: openingWindowsItem.startTime != '',
                                      child: Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState()
                                                    .editedLocalDateTimeRange =
                                                LocalDateTimeRangeStruct(
                                              startTime:
                                                  openingWindowsItem.startTime,
                                              endTime:
                                                  openingWindowsItem.endTime,
                                            );
                                            FFAppState()
                                                    .editedLocalDateTimeRangeAction =
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
                                                  child:
                                                      const LocalDateTimeRangeEditWidget(
                                                    isNew: false,
                                                  ),
                                                );
                                              },
                                            );

                                            if (FFAppState()
                                                    .editedLocalDateTimeRangeAction ==
                                                ActionType.UPDATE) {
                                              // Update selected range
                                              FFAppState()
                                                  .updateEditedMenuOfferStruct(
                                                (e) => e
                                                  ..updateOneTimeServingRanges(
                                                    (e) => e[
                                                            openingWindowsIndex] =
                                                        FFAppState()
                                                            .editedLocalDateTimeRange,
                                                  ),
                                              );
                                              safeSetState(() {});
                                            } else if (FFAppState()
                                                    .editedLocalDateTimeRangeAction ==
                                                ActionType.DELETE) {
                                              // Update selected range
                                              FFAppState()
                                                  .updateEditedMenuOfferStruct(
                                                (e) => e
                                                  ..updateOneTimeServingRanges(
                                                    (e) => e.removeAt(
                                                        openingWindowsIndex),
                                                  ),
                                              );
                                              safeSetState(() {});
                                            } else if (FFAppState()
                                                    .editedLocalDateTimeRangeAction ==
                                                ActionType.CREATE) {
                                              // Update selected range
                                              FFAppState()
                                                  .updateEditedMenuOfferStruct(
                                                (e) => e
                                                  ..updateOneTimeServingRanges(
                                                    (e) => e.add(FFAppState()
                                                        .editedLocalDateTimeRange),
                                                  ),
                                              );
                                              safeSetState(() {});
                                            }

                                            FFAppState()
                                                    .editedLocalDateTimeRange =
                                                LocalDateTimeRangeStruct();
                                            FFAppState()
                                                    .editedLocalDateTimeRangeAction =
                                                null;
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              title: Text(
                                                '${functions.dateTimeStringToString(openingWindowsItem.startTime)} - ${functions.dateTimeStringToString(openingWindowsItem.endTime)}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              dense: true,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                          ].divide(const SizedBox(height: 5.0)),
                        ),
                      ),
                    ],
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
                          FFAppState().editedMenuOfferAction = null;
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
                                FFAppState().editedMenuOfferAction =
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
                          FFAppState().updateEditedMenuOfferStruct(
                            (e) => e
                              ..name = _model.nameInputTextController.text
                              ..basePrice = MonetaryAmountStruct(
                                currencyCode: _model.ccyDropDownValue,
                                amount: double.tryParse(
                                    _model.basePriceInputTextController.text),
                              ),
                          );
                          if (widget.isNew) {
                            FFAppState().editedMenuOfferAction =
                                ActionType.CREATE;
                          } else {
                            FFAppState().editedMenuOfferAction =
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
