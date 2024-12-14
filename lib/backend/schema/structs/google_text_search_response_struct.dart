// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoogleTextSearchResponseStruct extends BaseStruct {
  GoogleTextSearchResponseStruct({
    String? id,
    String? formattedAddress,
    List<GoogleAddressComponentStruct>? addressComponents,
    LocationStruct? location,
    GoogleDisplayNameStruct? displayName,
  })  : _id = id,
        _formattedAddress = formattedAddress,
        _addressComponents = addressComponents,
        _location = location,
        _displayName = displayName;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "formattedAddress" field.
  String? _formattedAddress;
  String get formattedAddress => _formattedAddress ?? '';
  set formattedAddress(String? val) => _formattedAddress = val;

  bool hasFormattedAddress() => _formattedAddress != null;

  // "addressComponents" field.
  List<GoogleAddressComponentStruct>? _addressComponents;
  List<GoogleAddressComponentStruct> get addressComponents =>
      _addressComponents ?? const [];
  set addressComponents(List<GoogleAddressComponentStruct>? val) =>
      _addressComponents = val;

  void updateAddressComponents(
      Function(List<GoogleAddressComponentStruct>) updateFn) {
    updateFn(_addressComponents ??= []);
  }

  bool hasAddressComponents() => _addressComponents != null;

  // "location" field.
  LocationStruct? _location;
  LocationStruct get location => _location ?? LocationStruct();
  set location(LocationStruct? val) => _location = val;

  void updateLocation(Function(LocationStruct) updateFn) {
    updateFn(_location ??= LocationStruct());
  }

  bool hasLocation() => _location != null;

  // "displayName" field.
  GoogleDisplayNameStruct? _displayName;
  GoogleDisplayNameStruct get displayName =>
      _displayName ?? GoogleDisplayNameStruct();
  set displayName(GoogleDisplayNameStruct? val) => _displayName = val;

  void updateDisplayName(Function(GoogleDisplayNameStruct) updateFn) {
    updateFn(_displayName ??= GoogleDisplayNameStruct());
  }

  bool hasDisplayName() => _displayName != null;

  static GoogleTextSearchResponseStruct fromMap(Map<String, dynamic> data) =>
      GoogleTextSearchResponseStruct(
        id: data['id'] as String?,
        formattedAddress: data['formattedAddress'] as String?,
        addressComponents: getStructList(
          data['addressComponents'],
          GoogleAddressComponentStruct.fromMap,
        ),
        location: data['location'] is LocationStruct
            ? data['location']
            : LocationStruct.maybeFromMap(data['location']),
        displayName: data['displayName'] is GoogleDisplayNameStruct
            ? data['displayName']
            : GoogleDisplayNameStruct.maybeFromMap(data['displayName']),
      );

  static GoogleTextSearchResponseStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? GoogleTextSearchResponseStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'formattedAddress': _formattedAddress,
        'addressComponents': _addressComponents?.map((e) => e.toMap()).toList(),
        'location': _location?.toMap(),
        'displayName': _displayName?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'formattedAddress': serializeParam(
          _formattedAddress,
          ParamType.String,
        ),
        'addressComponents': serializeParam(
          _addressComponents,
          ParamType.DataStruct,
          isList: true,
        ),
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
        'displayName': serializeParam(
          _displayName,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static GoogleTextSearchResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GoogleTextSearchResponseStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        formattedAddress: deserializeParam(
          data['formattedAddress'],
          ParamType.String,
          false,
        ),
        addressComponents: deserializeStructParam<GoogleAddressComponentStruct>(
          data['addressComponents'],
          ParamType.DataStruct,
          true,
          structBuilder: GoogleAddressComponentStruct.fromSerializableMap,
        ),
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromSerializableMap,
        ),
        displayName: deserializeStructParam(
          data['displayName'],
          ParamType.DataStruct,
          false,
          structBuilder: GoogleDisplayNameStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GoogleTextSearchResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GoogleTextSearchResponseStruct &&
        id == other.id &&
        formattedAddress == other.formattedAddress &&
        listEquality.equals(addressComponents, other.addressComponents) &&
        location == other.location &&
        displayName == other.displayName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, formattedAddress, addressComponents, location, displayName]);
}

GoogleTextSearchResponseStruct createGoogleTextSearchResponseStruct({
  String? id,
  String? formattedAddress,
  LocationStruct? location,
  GoogleDisplayNameStruct? displayName,
}) =>
    GoogleTextSearchResponseStruct(
      id: id,
      formattedAddress: formattedAddress,
      location: location ?? LocationStruct(),
      displayName: displayName ?? GoogleDisplayNameStruct(),
    );
