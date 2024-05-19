// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? email,
    String? firstName,
    String? surname,
    String? role,
    String? uuid,
    bool? enabled,
  })  : _email = email,
        _firstName = firstName,
        _surname = surname,
        _role = role,
        _uuid = uuid,
        _enabled = enabled;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;
  bool hasFirstName() => _firstName != null;

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

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;
  bool hasUuid() => _uuid != null;

  // "enabled" field.
  bool? _enabled;
  bool get enabled => _enabled ?? true;
  set enabled(bool? val) => _enabled = val;
  bool hasEnabled() => _enabled != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        email: data['email'] as String?,
        firstName: data['firstName'] as String?,
        surname: data['surname'] as String?,
        role: data['role'] as String?,
        uuid: data['uuid'] as String?,
        enabled: data['enabled'] as bool?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'firstName': _firstName,
        'surname': _surname,
        'role': _role,
        'uuid': _uuid,
        'enabled': _enabled,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
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
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'enabled': serializeParam(
          _enabled,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
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
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        enabled: deserializeParam(
          data['enabled'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        email == other.email &&
        firstName == other.firstName &&
        surname == other.surname &&
        role == other.role &&
        uuid == other.uuid &&
        enabled == other.enabled;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([email, firstName, surname, role, uuid, enabled]);
}

UserStruct createUserStruct({
  String? email,
  String? firstName,
  String? surname,
  String? role,
  String? uuid,
  bool? enabled,
}) =>
    UserStruct(
      email: email,
      firstName: firstName,
      surname: surname,
      role: role,
      uuid: uuid,
      enabled: enabled,
    );
