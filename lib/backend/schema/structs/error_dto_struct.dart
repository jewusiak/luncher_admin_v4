// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ErrorDtoStruct extends BaseStruct {
  ErrorDtoStruct({
    String? message,
    String? cause,
    String? locale,
  })  : _message = message,
        _cause = cause,
        _locale = locale;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "cause" field.
  String? _cause;
  String get cause => _cause ?? '';
  set cause(String? val) => _cause = val;

  bool hasCause() => _cause != null;

  // "locale" field.
  String? _locale;
  String get locale => _locale ?? '';
  set locale(String? val) => _locale = val;

  bool hasLocale() => _locale != null;

  static ErrorDtoStruct fromMap(Map<String, dynamic> data) => ErrorDtoStruct(
        message: data['message'] as String?,
        cause: data['cause'] as String?,
        locale: data['locale'] as String?,
      );

  static ErrorDtoStruct? maybeFromMap(dynamic data) =>
      data is Map ? ErrorDtoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'cause': _cause,
        'locale': _locale,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'cause': serializeParam(
          _cause,
          ParamType.String,
        ),
        'locale': serializeParam(
          _locale,
          ParamType.String,
        ),
      }.withoutNulls;

  static ErrorDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ErrorDtoStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        cause: deserializeParam(
          data['cause'],
          ParamType.String,
          false,
        ),
        locale: deserializeParam(
          data['locale'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ErrorDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ErrorDtoStruct &&
        message == other.message &&
        cause == other.cause &&
        locale == other.locale;
  }

  @override
  int get hashCode => const ListEquality().hash([message, cause, locale]);
}

ErrorDtoStruct createErrorDtoStruct({
  String? message,
  String? cause,
  String? locale,
}) =>
    ErrorDtoStruct(
      message: message,
      cause: cause,
      locale: locale,
    );
