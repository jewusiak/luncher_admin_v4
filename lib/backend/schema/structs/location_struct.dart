// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationStruct extends BaseStruct {
  LocationStruct({
    int? latitude,
    int? longitude,
  })  : _latitude = latitude,
        _longitude = longitude;

  // "latitude" field.
  int? _latitude;
  int get latitude => _latitude ?? 0;
  set latitude(int? val) => _latitude = val;

  void incrementLatitude(int amount) => latitude = latitude + amount;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  int? _longitude;
  int get longitude => _longitude ?? 0;
  set longitude(int? val) => _longitude = val;

  void incrementLongitude(int amount) => longitude = longitude + amount;

  bool hasLongitude() => _longitude != null;

  static LocationStruct fromMap(Map<String, dynamic> data) => LocationStruct(
        latitude: castToType<int>(data['latitude']),
        longitude: castToType<int>(data['longitude']),
      );

  static LocationStruct? maybeFromMap(dynamic data) =>
      data is Map ? LocationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'latitude': _latitude,
        'longitude': _longitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latitude': serializeParam(
          _latitude,
          ParamType.int,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.int,
        ),
      }.withoutNulls;

  static LocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationStruct(
        latitude: deserializeParam(
          data['latitude'],
          ParamType.int,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationStruct &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode => const ListEquality().hash([latitude, longitude]);
}

LocationStruct createLocationStruct({
  int? latitude,
  int? longitude,
}) =>
    LocationStruct(
      latitude: latitude,
      longitude: longitude,
    );
