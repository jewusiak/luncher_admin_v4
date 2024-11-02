// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoogleDisplayNameStruct extends BaseStruct {
  GoogleDisplayNameStruct({
    String? text,
  }) : _text = text;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static GoogleDisplayNameStruct fromMap(Map<String, dynamic> data) =>
      GoogleDisplayNameStruct(
        text: data['text'] as String?,
      );

  static GoogleDisplayNameStruct? maybeFromMap(dynamic data) => data is Map
      ? GoogleDisplayNameStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static GoogleDisplayNameStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GoogleDisplayNameStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GoogleDisplayNameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoogleDisplayNameStruct && text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([text]);
}

GoogleDisplayNameStruct createGoogleDisplayNameStruct({
  String? text,
}) =>
    GoogleDisplayNameStruct(
      text: text,
    );
