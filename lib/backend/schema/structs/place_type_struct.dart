// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceTypeStruct extends BaseStruct {
  PlaceTypeStruct({
    String? identifier,
    String? iconName,
    String? name,
  })  : _identifier = identifier,
        _iconName = iconName,
        _name = name;

  // "identifier" field.
  String? _identifier;
  String get identifier => _identifier ?? '';
  set identifier(String? val) => _identifier = val;

  bool hasIdentifier() => _identifier != null;

  // "iconName" field.
  String? _iconName;
  String get iconName => _iconName ?? '';
  set iconName(String? val) => _iconName = val;

  bool hasIconName() => _iconName != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static PlaceTypeStruct fromMap(Map<String, dynamic> data) => PlaceTypeStruct(
        identifier: data['identifier'] as String?,
        iconName: data['iconName'] as String?,
        name: data['name'] as String?,
      );

  static PlaceTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'identifier': _identifier,
        'iconName': _iconName,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'identifier': serializeParam(
          _identifier,
          ParamType.String,
        ),
        'iconName': serializeParam(
          _iconName,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlaceTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaceTypeStruct(
        identifier: deserializeParam(
          data['identifier'],
          ParamType.String,
          false,
        ),
        iconName: deserializeParam(
          data['iconName'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlaceTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlaceTypeStruct &&
        identifier == other.identifier &&
        iconName == other.iconName &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([identifier, iconName, name]);
}

PlaceTypeStruct createPlaceTypeStruct({
  String? identifier,
  String? iconName,
  String? name,
}) =>
    PlaceTypeStruct(
      identifier: identifier,
      iconName: iconName,
      name: name,
    );
