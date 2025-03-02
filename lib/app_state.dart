import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  WeekDayTimeRangeStruct _editedWeekDayTimeRange = WeekDayTimeRangeStruct();
  WeekDayTimeRangeStruct get editedWeekDayTimeRange => _editedWeekDayTimeRange;
  set editedWeekDayTimeRange(WeekDayTimeRangeStruct value) {
    _editedWeekDayTimeRange = value;
  }

  void updateEditedWeekDayTimeRangeStruct(
      Function(WeekDayTimeRangeStruct) updateFn) {
    updateFn(_editedWeekDayTimeRange);
  }

  ActionType? _editedWeekDayTimeRangeAction;
  ActionType? get editedWeekDayTimeRangeAction => _editedWeekDayTimeRangeAction;
  set editedWeekDayTimeRangeAction(ActionType? value) {
    _editedWeekDayTimeRangeAction = value;
  }

  int _selectedGoogleMapPlacesApiIndex = -1;
  int get selectedGoogleMapPlacesApiIndex => _selectedGoogleMapPlacesApiIndex;
  set selectedGoogleMapPlacesApiIndex(int value) {
    _selectedGoogleMapPlacesApiIndex = value;
  }

  LocalDateTimeRangeStruct _editedLocalDateTimeRange =
      LocalDateTimeRangeStruct();
  LocalDateTimeRangeStruct get editedLocalDateTimeRange =>
      _editedLocalDateTimeRange;
  set editedLocalDateTimeRange(LocalDateTimeRangeStruct value) {
    _editedLocalDateTimeRange = value;
  }

  void updateEditedLocalDateTimeRangeStruct(
      Function(LocalDateTimeRangeStruct) updateFn) {
    updateFn(_editedLocalDateTimeRange);
  }

  ActionType? _editedLocalDateTimeRangeAction;
  ActionType? get editedLocalDateTimeRangeAction =>
      _editedLocalDateTimeRangeAction;
  set editedLocalDateTimeRangeAction(ActionType? value) {
    _editedLocalDateTimeRangeAction = value;
  }

  MenuOfferStruct _editedMenuOffer = MenuOfferStruct();
  MenuOfferStruct get editedMenuOffer => _editedMenuOffer;
  set editedMenuOffer(MenuOfferStruct value) {
    _editedMenuOffer = value;
  }

  void updateEditedMenuOfferStruct(Function(MenuOfferStruct) updateFn) {
    updateFn(_editedMenuOffer);
  }

  ActionType? _editedMenuOfferAction;
  ActionType? get editedMenuOfferAction => _editedMenuOfferAction;
  set editedMenuOfferAction(ActionType? value) {
    _editedMenuOfferAction = value;
  }

  PartStruct _editedOfferPart = PartStruct();
  PartStruct get editedOfferPart => _editedOfferPart;
  set editedOfferPart(PartStruct value) {
    _editedOfferPart = value;
  }

  void updateEditedOfferPartStruct(Function(PartStruct) updateFn) {
    updateFn(_editedOfferPart);
  }

  ActionType? _editedOfferPartAction;
  ActionType? get editedOfferPartAction => _editedOfferPartAction;
  set editedOfferPartAction(ActionType? value) {
    _editedOfferPartAction = value;
  }

  OptionStruct _editedOption = OptionStruct();
  OptionStruct get editedOption => _editedOption;
  set editedOption(OptionStruct value) {
    _editedOption = value;
  }

  void updateEditedOptionStruct(Function(OptionStruct) updateFn) {
    updateFn(_editedOption);
  }

  ActionType? _editedOptionAction;
  ActionType? get editedOptionAction => _editedOptionAction;
  set editedOptionAction(ActionType? value) {
    _editedOptionAction = value;
  }

  SectionElementDtoStruct _editedSectionElement = SectionElementDtoStruct();
  SectionElementDtoStruct get editedSectionElement => _editedSectionElement;
  set editedSectionElement(SectionElementDtoStruct value) {
    _editedSectionElement = value;
  }

  void updateEditedSectionElementStruct(
      Function(SectionElementDtoStruct) updateFn) {
    updateFn(_editedSectionElement);
  }

  ActionType? _editedSectionElementAction;
  ActionType? get editedSectionElementAction => _editedSectionElementAction;
  set editedSectionElementAction(ActionType? value) {
    _editedSectionElementAction = value;
  }

  SectionDtoStruct _editedSection = SectionDtoStruct();
  SectionDtoStruct get editedSection => _editedSection;
  set editedSection(SectionDtoStruct value) {
    _editedSection = value;
  }

  void updateEditedSectionStruct(Function(SectionDtoStruct) updateFn) {
    updateFn(_editedSection);
  }

  ActionType? _editedSectionAction;
  ActionType? get editedSectionAction => _editedSectionAction;
  set editedSectionAction(ActionType? value) {
    _editedSectionAction = value;
  }

  ImportSchemaDtoStruct _editedImportSchema = ImportSchemaDtoStruct();
  ImportSchemaDtoStruct get editedImportSchema => _editedImportSchema;
  set editedImportSchema(ImportSchemaDtoStruct value) {
    _editedImportSchema = value;
  }

  void updateEditedImportSchemaStruct(
      Function(ImportSchemaDtoStruct) updateFn) {
    updateFn(_editedImportSchema);
  }

  ActionType? _editedImportSchemaAction;
  ActionType? get editedImportSchemaAction => _editedImportSchemaAction;
  set editedImportSchemaAction(ActionType? value) {
    _editedImportSchemaAction = value;
  }

  int _gliter = 0;
  int get gliter => _gliter;
  set gliter(int value) {
    _gliter = value;
  }

  final _getTimezonesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getTimezones({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getTimezonesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetTimezonesCache() => _getTimezonesManager.clear();
  void clearGetTimezonesCacheKey(String? uniqueKey) =>
      _getTimezonesManager.clearRequest(uniqueKey);
}
