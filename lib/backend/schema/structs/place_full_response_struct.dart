// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceFullResponseStruct extends BaseStruct {
  PlaceFullResponseStruct({
    String? id,
    String? name,
    String? longName,
    String? description,
    String? facebookPageId,
    String? instagramHandle,
    String? webpageUrl,
    String? phoneNumber,
    AddressStruct? address,
    String? googleMapsReference,
    List<WeekDayTimeRangeStruct>? openingWindows,
    PlaceTypeStruct? placeType,
    LocationStruct? location,
    UserIdDtoStruct? owner,
    List<AssetStruct>? images,
    List<MenuOfferStruct>? menuOffers,
    bool? enabled,
  })  : _id = id,
        _name = name,
        _longName = longName,
        _description = description,
        _facebookPageId = facebookPageId,
        _instagramHandle = instagramHandle,
        _webpageUrl = webpageUrl,
        _phoneNumber = phoneNumber,
        _address = address,
        _googleMapsReference = googleMapsReference,
        _openingWindows = openingWindows,
        _placeType = placeType,
        _location = location,
        _owner = owner,
        _images = images,
        _menuOffers = menuOffers,
        _enabled = enabled;

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

  // "longName" field.
  String? _longName;
  String get longName => _longName ?? '';
  set longName(String? val) => _longName = val;

  bool hasLongName() => _longName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "facebookPageId" field.
  String? _facebookPageId;
  String get facebookPageId => _facebookPageId ?? '';
  set facebookPageId(String? val) => _facebookPageId = val;

  bool hasFacebookPageId() => _facebookPageId != null;

  // "instagramHandle" field.
  String? _instagramHandle;
  String get instagramHandle => _instagramHandle ?? '';
  set instagramHandle(String? val) => _instagramHandle = val;

  bool hasInstagramHandle() => _instagramHandle != null;

  // "webpageUrl" field.
  String? _webpageUrl;
  String get webpageUrl => _webpageUrl ?? '';
  set webpageUrl(String? val) => _webpageUrl = val;

  bool hasWebpageUrl() => _webpageUrl != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  set address(AddressStruct? val) => _address = val;

  void updateAddress(Function(AddressStruct) updateFn) {
    updateFn(_address ??= AddressStruct());
  }

  bool hasAddress() => _address != null;

  // "googleMapsReference" field.
  String? _googleMapsReference;
  String get googleMapsReference => _googleMapsReference ?? '';
  set googleMapsReference(String? val) => _googleMapsReference = val;

  bool hasGoogleMapsReference() => _googleMapsReference != null;

  // "openingWindows" field.
  List<WeekDayTimeRangeStruct>? _openingWindows;
  List<WeekDayTimeRangeStruct> get openingWindows =>
      _openingWindows ?? const [];
  set openingWindows(List<WeekDayTimeRangeStruct>? val) =>
      _openingWindows = val;

  void updateOpeningWindows(Function(List<WeekDayTimeRangeStruct>) updateFn) {
    updateFn(_openingWindows ??= []);
  }

  bool hasOpeningWindows() => _openingWindows != null;

  // "placeType" field.
  PlaceTypeStruct? _placeType;
  PlaceTypeStruct get placeType => _placeType ?? PlaceTypeStruct();
  set placeType(PlaceTypeStruct? val) => _placeType = val;

  void updatePlaceType(Function(PlaceTypeStruct) updateFn) {
    updateFn(_placeType ??= PlaceTypeStruct());
  }

  bool hasPlaceType() => _placeType != null;

  // "location" field.
  LocationStruct? _location;
  LocationStruct get location => _location ?? LocationStruct();
  set location(LocationStruct? val) => _location = val;

  void updateLocation(Function(LocationStruct) updateFn) {
    updateFn(_location ??= LocationStruct());
  }

  bool hasLocation() => _location != null;

  // "owner" field.
  UserIdDtoStruct? _owner;
  UserIdDtoStruct get owner => _owner ?? UserIdDtoStruct();
  set owner(UserIdDtoStruct? val) => _owner = val;

  void updateOwner(Function(UserIdDtoStruct) updateFn) {
    updateFn(_owner ??= UserIdDtoStruct());
  }

  bool hasOwner() => _owner != null;

  // "images" field.
  List<AssetStruct>? _images;
  List<AssetStruct> get images => _images ?? const [];
  set images(List<AssetStruct>? val) => _images = val;

  void updateImages(Function(List<AssetStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "menuOffers" field.
  List<MenuOfferStruct>? _menuOffers;
  List<MenuOfferStruct> get menuOffers => _menuOffers ?? const [];
  set menuOffers(List<MenuOfferStruct>? val) => _menuOffers = val;

  void updateMenuOffers(Function(List<MenuOfferStruct>) updateFn) {
    updateFn(_menuOffers ??= []);
  }

  bool hasMenuOffers() => _menuOffers != null;

  // "enabled" field.
  bool? _enabled;
  bool get enabled => _enabled ?? false;
  set enabled(bool? val) => _enabled = val;

  bool hasEnabled() => _enabled != null;

  static PlaceFullResponseStruct fromMap(Map<String, dynamic> data) =>
      PlaceFullResponseStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        longName: data['longName'] as String?,
        description: data['description'] as String?,
        facebookPageId: data['facebookPageId'] as String?,
        instagramHandle: data['instagramHandle'] as String?,
        webpageUrl: data['webpageUrl'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        address: AddressStruct.maybeFromMap(data['address']),
        googleMapsReference: data['googleMapsReference'] as String?,
        openingWindows: getStructList(
          data['openingWindows'],
          WeekDayTimeRangeStruct.fromMap,
        ),
        placeType: PlaceTypeStruct.maybeFromMap(data['placeType']),
        location: LocationStruct.maybeFromMap(data['location']),
        owner: UserIdDtoStruct.maybeFromMap(data['owner']),
        images: getStructList(
          data['images'],
          AssetStruct.fromMap,
        ),
        menuOffers: getStructList(
          data['menuOffers'],
          MenuOfferStruct.fromMap,
        ),
        enabled: data['enabled'] as bool?,
      );

  static PlaceFullResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaceFullResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'longName': _longName,
        'description': _description,
        'facebookPageId': _facebookPageId,
        'instagramHandle': _instagramHandle,
        'webpageUrl': _webpageUrl,
        'phoneNumber': _phoneNumber,
        'address': _address?.toMap(),
        'googleMapsReference': _googleMapsReference,
        'openingWindows': _openingWindows?.map((e) => e.toMap()).toList(),
        'placeType': _placeType?.toMap(),
        'location': _location?.toMap(),
        'owner': _owner?.toMap(),
        'images': _images?.map((e) => e.toMap()).toList(),
        'menuOffers': _menuOffers?.map((e) => e.toMap()).toList(),
        'enabled': _enabled,
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
        'longName': serializeParam(
          _longName,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'facebookPageId': serializeParam(
          _facebookPageId,
          ParamType.String,
        ),
        'instagramHandle': serializeParam(
          _instagramHandle,
          ParamType.String,
        ),
        'webpageUrl': serializeParam(
          _webpageUrl,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.DataStruct,
        ),
        'googleMapsReference': serializeParam(
          _googleMapsReference,
          ParamType.String,
        ),
        'openingWindows': serializeParam(
          _openingWindows,
          ParamType.DataStruct,
          isList: true,
        ),
        'placeType': serializeParam(
          _placeType,
          ParamType.DataStruct,
        ),
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
        'owner': serializeParam(
          _owner,
          ParamType.DataStruct,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'menuOffers': serializeParam(
          _menuOffers,
          ParamType.DataStruct,
          isList: true,
        ),
        'enabled': serializeParam(
          _enabled,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PlaceFullResponseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PlaceFullResponseStruct(
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
        longName: deserializeParam(
          data['longName'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        facebookPageId: deserializeParam(
          data['facebookPageId'],
          ParamType.String,
          false,
        ),
        instagramHandle: deserializeParam(
          data['instagramHandle'],
          ParamType.String,
          false,
        ),
        webpageUrl: deserializeParam(
          data['webpageUrl'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        address: deserializeStructParam(
          data['address'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressStruct.fromSerializableMap,
        ),
        googleMapsReference: deserializeParam(
          data['googleMapsReference'],
          ParamType.String,
          false,
        ),
        openingWindows: deserializeStructParam<WeekDayTimeRangeStruct>(
          data['openingWindows'],
          ParamType.DataStruct,
          true,
          structBuilder: WeekDayTimeRangeStruct.fromSerializableMap,
        ),
        placeType: deserializeStructParam(
          data['placeType'],
          ParamType.DataStruct,
          false,
          structBuilder: PlaceTypeStruct.fromSerializableMap,
        ),
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromSerializableMap,
        ),
        owner: deserializeStructParam(
          data['owner'],
          ParamType.DataStruct,
          false,
          structBuilder: UserIdDtoStruct.fromSerializableMap,
        ),
        images: deserializeStructParam<AssetStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: AssetStruct.fromSerializableMap,
        ),
        menuOffers: deserializeStructParam<MenuOfferStruct>(
          data['menuOffers'],
          ParamType.DataStruct,
          true,
          structBuilder: MenuOfferStruct.fromSerializableMap,
        ),
        enabled: deserializeParam(
          data['enabled'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PlaceFullResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlaceFullResponseStruct &&
        id == other.id &&
        name == other.name &&
        longName == other.longName &&
        description == other.description &&
        facebookPageId == other.facebookPageId &&
        instagramHandle == other.instagramHandle &&
        webpageUrl == other.webpageUrl &&
        phoneNumber == other.phoneNumber &&
        address == other.address &&
        googleMapsReference == other.googleMapsReference &&
        listEquality.equals(openingWindows, other.openingWindows) &&
        placeType == other.placeType &&
        location == other.location &&
        owner == other.owner &&
        listEquality.equals(images, other.images) &&
        listEquality.equals(menuOffers, other.menuOffers) &&
        enabled == other.enabled;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        longName,
        description,
        facebookPageId,
        instagramHandle,
        webpageUrl,
        phoneNumber,
        address,
        googleMapsReference,
        openingWindows,
        placeType,
        location,
        owner,
        images,
        menuOffers,
        enabled
      ]);
}

PlaceFullResponseStruct createPlaceFullResponseStruct({
  String? id,
  String? name,
  String? longName,
  String? description,
  String? facebookPageId,
  String? instagramHandle,
  String? webpageUrl,
  String? phoneNumber,
  AddressStruct? address,
  String? googleMapsReference,
  PlaceTypeStruct? placeType,
  LocationStruct? location,
  UserIdDtoStruct? owner,
  bool? enabled,
}) =>
    PlaceFullResponseStruct(
      id: id,
      name: name,
      longName: longName,
      description: description,
      facebookPageId: facebookPageId,
      instagramHandle: instagramHandle,
      webpageUrl: webpageUrl,
      phoneNumber: phoneNumber,
      address: address ?? AddressStruct(),
      googleMapsReference: googleMapsReference,
      placeType: placeType ?? PlaceTypeStruct(),
      location: location ?? LocationStruct(),
      owner: owner ?? UserIdDtoStruct(),
      enabled: enabled,
    );
