// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssetStruct extends BaseStruct {
  AssetStruct({
    String? uuid,
    String? name,
    String? description,
    String? dateCreated,
    String? publicUrl,
  })  : _uuid = uuid,
        _name = name,
        _description = description,
        _dateCreated = dateCreated,
        _publicUrl = publicUrl;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;

  bool hasUuid() => _uuid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "dateCreated" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

  // "publicUrl" field.
  String? _publicUrl;
  String get publicUrl => _publicUrl ?? '';
  set publicUrl(String? val) => _publicUrl = val;

  bool hasPublicUrl() => _publicUrl != null;

  static AssetStruct fromMap(Map<String, dynamic> data) => AssetStruct(
        uuid: data['uuid'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        dateCreated: data['dateCreated'] as String?,
        publicUrl: data['publicUrl'] as String?,
      );

  static AssetStruct? maybeFromMap(dynamic data) =>
      data is Map ? AssetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'uuid': _uuid,
        'name': _name,
        'description': _description,
        'dateCreated': _dateCreated,
        'publicUrl': _publicUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'dateCreated': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'publicUrl': serializeParam(
          _publicUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static AssetStruct fromSerializableMap(Map<String, dynamic> data) =>
      AssetStruct(
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        dateCreated: deserializeParam(
          data['dateCreated'],
          ParamType.String,
          false,
        ),
        publicUrl: deserializeParam(
          data['publicUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AssetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssetStruct &&
        uuid == other.uuid &&
        name == other.name &&
        description == other.description &&
        dateCreated == other.dateCreated &&
        publicUrl == other.publicUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([uuid, name, description, dateCreated, publicUrl]);
}

AssetStruct createAssetStruct({
  String? uuid,
  String? name,
  String? description,
  String? dateCreated,
  String? publicUrl,
}) =>
    AssetStruct(
      uuid: uuid,
      name: name,
      description: description,
      dateCreated: dateCreated,
      publicUrl: publicUrl,
    );
