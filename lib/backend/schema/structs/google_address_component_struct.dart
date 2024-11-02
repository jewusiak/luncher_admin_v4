// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoogleAddressComponentStruct extends BaseStruct {
  GoogleAddressComponentStruct({
    String? longText,
    String? shortText,
    List<String>? types,
    String? languageCode,
  })  : _longText = longText,
        _shortText = shortText,
        _types = types,
        _languageCode = languageCode;

  // "longText" field.
  String? _longText;
  String get longText => _longText ?? '';
  set longText(String? val) => _longText = val;

  bool hasLongText() => _longText != null;

  // "shortText" field.
  String? _shortText;
  String get shortText => _shortText ?? '';
  set shortText(String? val) => _shortText = val;

  bool hasShortText() => _shortText != null;

  // "types" field.
  List<String>? _types;
  List<String> get types => _types ?? const [];
  set types(List<String>? val) => _types = val;

  void updateTypes(Function(List<String>) updateFn) {
    updateFn(_types ??= []);
  }

  bool hasTypes() => _types != null;

  // "languageCode" field.
  String? _languageCode;
  String get languageCode => _languageCode ?? '';
  set languageCode(String? val) => _languageCode = val;

  bool hasLanguageCode() => _languageCode != null;

  static GoogleAddressComponentStruct fromMap(Map<String, dynamic> data) =>
      GoogleAddressComponentStruct(
        longText: data['longText'] as String?,
        shortText: data['shortText'] as String?,
        types: getDataList(data['types']),
        languageCode: data['languageCode'] as String?,
      );

  static GoogleAddressComponentStruct? maybeFromMap(dynamic data) => data is Map
      ? GoogleAddressComponentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'longText': _longText,
        'shortText': _shortText,
        'types': _types,
        'languageCode': _languageCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'longText': serializeParam(
          _longText,
          ParamType.String,
        ),
        'shortText': serializeParam(
          _shortText,
          ParamType.String,
        ),
        'types': serializeParam(
          _types,
          ParamType.String,
          isList: true,
        ),
        'languageCode': serializeParam(
          _languageCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static GoogleAddressComponentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GoogleAddressComponentStruct(
        longText: deserializeParam(
          data['longText'],
          ParamType.String,
          false,
        ),
        shortText: deserializeParam(
          data['shortText'],
          ParamType.String,
          false,
        ),
        types: deserializeParam<String>(
          data['types'],
          ParamType.String,
          true,
        ),
        languageCode: deserializeParam(
          data['languageCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GoogleAddressComponentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GoogleAddressComponentStruct &&
        longText == other.longText &&
        shortText == other.shortText &&
        listEquality.equals(types, other.types) &&
        languageCode == other.languageCode;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([longText, shortText, types, languageCode]);
}

GoogleAddressComponentStruct createGoogleAddressComponentStruct({
  String? longText,
  String? shortText,
  String? languageCode,
}) =>
    GoogleAddressComponentStruct(
      longText: longText,
      shortText: shortText,
      languageCode: languageCode,
    );
