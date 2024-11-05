import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';

List<String> concatLists(
  List<String> list1,
  List<String> list2,
) {
  return list1 + list2;
}

PartStruct? clonePartObject(PartStruct? obj) {
  return obj == null
      ? null
      : PartStruct.fromMap(jsonDecode(jsonEncode(obj.toMap())));
}

OptionStruct? cloneOptionObject(OptionStruct? obj) {
  return obj == null
      ? null
      : OptionStruct.fromMap(jsonDecode(jsonEncode(obj.toMap())));
}

List<String> concatStringWithList(
  String str,
  List<String> list,
) {
  return [str, ...list];
}

List<WeekDayTimeRangeStruct>? getEmptyWeekDayTimeRangeList() {
  return [];
}

String? timeToString(DateTime? time) {
  return time == null ? null : DateFormat.Hm().format(time);
}

DateTime? timeStringToDateTime(String? str) {
  return str == null ? null : DateTime.tryParse("1970-01-01T${str}");
}

List<WeekDayTimeRangeStruct> removeFromListAtIndex(
  List<WeekDayTimeRangeStruct> list,
  int index,
) {
  print("removing${index} from ${list}");
  list.removeAt(index);

  print("after removal ${list}");
  return list;
}

LatLng? locationToLatLng(LocationStruct? input) {
  return input == null ? null : LatLng(input.latitude, input.longitude);
}

GoogleAddressComponentStruct getGoogleAddressComponent(
  List<GoogleTextSearchResponseStruct>? response,
  int index,
  String name,
) {
  var list =
      response?[index].addressComponents.where((e) => e.types.contains(name)) ??
          [];
  var a = list.isEmpty
      ? GoogleAddressComponentStruct(
          longText: "", shortText: "", types: [], languageCode: "")
      : list.first;

  return a;
}

MenuOfferStruct? cloneMenuOfferObject(MenuOfferStruct? menuOffer) {
  return menuOffer == null
      ? null
      : MenuOfferStruct.fromMap(jsonDecode(jsonEncode(menuOffer.toMap())));
}

String? dateTimeStringToString(String? input) {
  if (input == null) return null;

  DateTime? date = DateTime.tryParse(input);
  return date == null ? null : DateFormat('dd.MM.yyyy HH:mm').format(date);
}

String? replaceCommaWithDot(String? str) {
  if (str == null) return null;
  List<String> splitted = str.split(RegExp("\\.|,"));
  return splitted.length < 2
      ? splitted[0]
      : "${splitted[0]}.${splitted.sublist(1).join()}";
}
