import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

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
}
