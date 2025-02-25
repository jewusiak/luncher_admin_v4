// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImportSchemaDtoStruct extends BaseStruct {
  ImportSchemaDtoStruct({
    String? id,
    String? name,
    String? placeId,
    String? importCron,
    bool? enabled,
    String? schemaType,
    String? pageUrl,
    String? postSelectionCustomPrompt,
    String? importCustomPrompt,
    String? importCronDescription,
  })  : _id = id,
        _name = name,
        _placeId = placeId,
        _importCron = importCron,
        _enabled = enabled,
        _schemaType = schemaType,
        _pageUrl = pageUrl,
        _postSelectionCustomPrompt = postSelectionCustomPrompt,
        _importCustomPrompt = importCustomPrompt,
        _importCronDescription = importCronDescription;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "placeId" field.
  String? _placeId;
  String get placeId => _placeId ?? '';
  set placeId(String? val) => _placeId = val;

  bool hasPlaceId() => _placeId != null;

  // "importCron" field.
  String? _importCron;
  String get importCron => _importCron ?? '';
  set importCron(String? val) => _importCron = val;

  bool hasImportCron() => _importCron != null;

  // "enabled" field.
  bool? _enabled;
  bool get enabled => _enabled ?? false;
  set enabled(bool? val) => _enabled = val;

  bool hasEnabled() => _enabled != null;

  // "schemaType" field.
  String? _schemaType;
  String get schemaType => _schemaType ?? '';
  set schemaType(String? val) => _schemaType = val;

  bool hasSchemaType() => _schemaType != null;

  // "pageUrl" field.
  String? _pageUrl;
  String get pageUrl => _pageUrl ?? '';
  set pageUrl(String? val) => _pageUrl = val;

  bool hasPageUrl() => _pageUrl != null;

  // "postSelectionCustomPrompt" field.
  String? _postSelectionCustomPrompt;
  String get postSelectionCustomPrompt => _postSelectionCustomPrompt ?? '';
  set postSelectionCustomPrompt(String? val) =>
      _postSelectionCustomPrompt = val;

  bool hasPostSelectionCustomPrompt() => _postSelectionCustomPrompt != null;

  // "importCustomPrompt" field.
  String? _importCustomPrompt;
  String get importCustomPrompt => _importCustomPrompt ?? '';
  set importCustomPrompt(String? val) => _importCustomPrompt = val;

  bool hasImportCustomPrompt() => _importCustomPrompt != null;

  // "importCronDescription" field.
  String? _importCronDescription;
  String get importCronDescription => _importCronDescription ?? '';
  set importCronDescription(String? val) => _importCronDescription = val;

  bool hasImportCronDescription() => _importCronDescription != null;

  static ImportSchemaDtoStruct fromMap(Map<String, dynamic> data) =>
      ImportSchemaDtoStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        placeId: data['placeId'] as String?,
        importCron: data['importCron'] as String?,
        enabled: data['enabled'] as bool?,
        schemaType: data['schemaType'] as String?,
        pageUrl: data['pageUrl'] as String?,
        postSelectionCustomPrompt: data['postSelectionCustomPrompt'] as String?,
        importCustomPrompt: data['importCustomPrompt'] as String?,
        importCronDescription: data['importCronDescription'] as String?,
      );

  static ImportSchemaDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? ImportSchemaDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'placeId': _placeId,
        'importCron': _importCron,
        'enabled': _enabled,
        'schemaType': _schemaType,
        'pageUrl': _pageUrl,
        'postSelectionCustomPrompt': _postSelectionCustomPrompt,
        'importCustomPrompt': _importCustomPrompt,
        'importCronDescription': _importCronDescription,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'placeId': serializeParam(
          _placeId,
          ParamType.String,
        ),
        'importCron': serializeParam(
          _importCron,
          ParamType.String,
        ),
        'enabled': serializeParam(
          _enabled,
          ParamType.bool,
        ),
        'schemaType': serializeParam(
          _schemaType,
          ParamType.String,
        ),
        'pageUrl': serializeParam(
          _pageUrl,
          ParamType.String,
        ),
        'postSelectionCustomPrompt': serializeParam(
          _postSelectionCustomPrompt,
          ParamType.String,
        ),
        'importCustomPrompt': serializeParam(
          _importCustomPrompt,
          ParamType.String,
        ),
        'importCronDescription': serializeParam(
          _importCronDescription,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImportSchemaDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImportSchemaDtoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        placeId: deserializeParam(
          data['placeId'],
          ParamType.String,
          false,
        ),
        importCron: deserializeParam(
          data['importCron'],
          ParamType.String,
          false,
        ),
        enabled: deserializeParam(
          data['enabled'],
          ParamType.bool,
          false,
        ),
        schemaType: deserializeParam(
          data['schemaType'],
          ParamType.String,
          false,
        ),
        pageUrl: deserializeParam(
          data['pageUrl'],
          ParamType.String,
          false,
        ),
        postSelectionCustomPrompt: deserializeParam(
          data['postSelectionCustomPrompt'],
          ParamType.String,
          false,
        ),
        importCustomPrompt: deserializeParam(
          data['importCustomPrompt'],
          ParamType.String,
          false,
        ),
        importCronDescription: deserializeParam(
          data['importCronDescription'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImportSchemaDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImportSchemaDtoStruct &&
        id == other.id &&
        name == other.name &&
        placeId == other.placeId &&
        importCron == other.importCron &&
        enabled == other.enabled &&
        schemaType == other.schemaType &&
        pageUrl == other.pageUrl &&
        postSelectionCustomPrompt == other.postSelectionCustomPrompt &&
        importCustomPrompt == other.importCustomPrompt &&
        importCronDescription == other.importCronDescription;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        placeId,
        importCron,
        enabled,
        schemaType,
        pageUrl,
        postSelectionCustomPrompt,
        importCustomPrompt,
        importCronDescription
      ]);
}

ImportSchemaDtoStruct createImportSchemaDtoStruct({
  String? id,
  String? name,
  String? placeId,
  String? importCron,
  bool? enabled,
  String? schemaType,
  String? pageUrl,
  String? postSelectionCustomPrompt,
  String? importCustomPrompt,
  String? importCronDescription,
}) =>
    ImportSchemaDtoStruct(
      id: id,
      name: name,
      placeId: placeId,
      importCron: importCron,
      enabled: enabled,
      schemaType: schemaType,
      pageUrl: pageUrl,
      postSelectionCustomPrompt: postSelectionCustomPrompt,
      importCustomPrompt: importCustomPrompt,
      importCronDescription: importCronDescription,
    );
