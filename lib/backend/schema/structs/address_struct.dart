// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends BaseStruct {
  AddressStruct({
    String? firstLine,
    String? secondLine,
    String? zipCode,
    String? city,
    String? district,
    String? description,
    String? country,
  })  : _firstLine = firstLine,
        _secondLine = secondLine,
        _zipCode = zipCode,
        _city = city,
        _district = district,
        _description = description,
        _country = country;

  // "firstLine" field.
  String? _firstLine;
  String get firstLine => _firstLine ?? '';
  set firstLine(String? val) => _firstLine = val;

  bool hasFirstLine() => _firstLine != null;

  // "secondLine" field.
  String? _secondLine;
  String get secondLine => _secondLine ?? '';
  set secondLine(String? val) => _secondLine = val;

  bool hasSecondLine() => _secondLine != null;

  // "zipCode" field.
  String? _zipCode;
  String get zipCode => _zipCode ?? '';
  set zipCode(String? val) => _zipCode = val;

  bool hasZipCode() => _zipCode != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "district" field.
  String? _district;
  String get district => _district ?? '';
  set district(String? val) => _district = val;

  bool hasDistrict() => _district != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        firstLine: data['firstLine'] as String?,
        secondLine: data['secondLine'] as String?,
        zipCode: data['zipCode'] as String?,
        city: data['city'] as String?,
        district: data['district'] as String?,
        description: data['description'] as String?,
        country: data['country'] as String?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'firstLine': _firstLine,
        'secondLine': _secondLine,
        'zipCode': _zipCode,
        'city': _city,
        'district': _district,
        'description': _description,
        'country': _country,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'firstLine': serializeParam(
          _firstLine,
          ParamType.String,
        ),
        'secondLine': serializeParam(
          _secondLine,
          ParamType.String,
        ),
        'zipCode': serializeParam(
          _zipCode,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'district': serializeParam(
          _district,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        firstLine: deserializeParam(
          data['firstLine'],
          ParamType.String,
          false,
        ),
        secondLine: deserializeParam(
          data['secondLine'],
          ParamType.String,
          false,
        ),
        zipCode: deserializeParam(
          data['zipCode'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        district: deserializeParam(
          data['district'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        firstLine == other.firstLine &&
        secondLine == other.secondLine &&
        zipCode == other.zipCode &&
        city == other.city &&
        district == other.district &&
        description == other.description &&
        country == other.country;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [firstLine, secondLine, zipCode, city, district, description, country]);
}

AddressStruct createAddressStruct({
  String? firstLine,
  String? secondLine,
  String? zipCode,
  String? city,
  String? district,
  String? description,
  String? country,
}) =>
    AddressStruct(
      firstLine: firstLine,
      secondLine: secondLine,
      zipCode: zipCode,
      city: city,
      district: district,
      description: description,
      country: country,
    );
