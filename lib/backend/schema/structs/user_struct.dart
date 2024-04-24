// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? email,
    String? firstname,
    String? surname,
    String? role,
  })  : _email = email,
        _firstname = firstname,
        _surname = surname,
        _role = role;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  set firstname(String? val) => _firstname = val;
  bool hasFirstname() => _firstname != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  set surname(String? val) => _surname = val;
  bool hasSurname() => _surname != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;
  bool hasRole() => _role != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        email: data['email'] as String?,
        firstname: data['firstname'] as String?,
        surname: data['surname'] as String?,
        role: data['role'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'firstname': _firstname,
        'surname': _surname,
        'role': _role,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'firstname': serializeParam(
          _firstname,
          ParamType.String,
        ),
        'surname': serializeParam(
          _surname,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        firstname: deserializeParam(
          data['firstname'],
          ParamType.String,
          false,
        ),
        surname: deserializeParam(
          data['surname'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        email == other.email &&
        firstname == other.firstname &&
        surname == other.surname &&
        role == other.role;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([email, firstname, surname, role]);
}

UserStruct createUserStruct({
  String? email,
  String? firstname,
  String? surname,
  String? role,
}) =>
    UserStruct(
      email: email,
      firstname: firstname,
      surname: surname,
      role: role,
    );
