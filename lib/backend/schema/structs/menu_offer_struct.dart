// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuOfferStruct extends BaseStruct {
  MenuOfferStruct({
    String? id,
    String? name,
    MonetaryAmountStruct? basePrice,
    List<PartStruct>? parts,
    List<WeekDayTimeRangeStruct>? recurringServingRanges,
    List<LocalDateTimeRangeStruct>? oneTimeServingRanges,
  })  : _id = id,
        _name = name,
        _basePrice = basePrice,
        _parts = parts,
        _recurringServingRanges = recurringServingRanges,
        _oneTimeServingRanges = oneTimeServingRanges;

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

  // "basePrice" field.
  MonetaryAmountStruct? _basePrice;
  MonetaryAmountStruct get basePrice => _basePrice ?? MonetaryAmountStruct();
  set basePrice(MonetaryAmountStruct? val) => _basePrice = val;

  void updateBasePrice(Function(MonetaryAmountStruct) updateFn) {
    updateFn(_basePrice ??= MonetaryAmountStruct());
  }

  bool hasBasePrice() => _basePrice != null;

  // "parts" field.
  List<PartStruct>? _parts;
  List<PartStruct> get parts => _parts ?? const [];
  set parts(List<PartStruct>? val) => _parts = val;

  void updateParts(Function(List<PartStruct>) updateFn) {
    updateFn(_parts ??= []);
  }

  bool hasParts() => _parts != null;

  // "recurringServingRanges" field.
  List<WeekDayTimeRangeStruct>? _recurringServingRanges;
  List<WeekDayTimeRangeStruct> get recurringServingRanges =>
      _recurringServingRanges ?? const [];
  set recurringServingRanges(List<WeekDayTimeRangeStruct>? val) =>
      _recurringServingRanges = val;

  void updateRecurringServingRanges(
      Function(List<WeekDayTimeRangeStruct>) updateFn) {
    updateFn(_recurringServingRanges ??= []);
  }

  bool hasRecurringServingRanges() => _recurringServingRanges != null;

  // "oneTimeServingRanges" field.
  List<LocalDateTimeRangeStruct>? _oneTimeServingRanges;
  List<LocalDateTimeRangeStruct> get oneTimeServingRanges =>
      _oneTimeServingRanges ?? const [];
  set oneTimeServingRanges(List<LocalDateTimeRangeStruct>? val) =>
      _oneTimeServingRanges = val;

  void updateOneTimeServingRanges(
      Function(List<LocalDateTimeRangeStruct>) updateFn) {
    updateFn(_oneTimeServingRanges ??= []);
  }

  bool hasOneTimeServingRanges() => _oneTimeServingRanges != null;

  static MenuOfferStruct fromMap(Map<String, dynamic> data) => MenuOfferStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        basePrice: data['basePrice'] is MonetaryAmountStruct
            ? data['basePrice']
            : MonetaryAmountStruct.maybeFromMap(data['basePrice']),
        parts: getStructList(
          data['parts'],
          PartStruct.fromMap,
        ),
        recurringServingRanges: getStructList(
          data['recurringServingRanges'],
          WeekDayTimeRangeStruct.fromMap,
        ),
        oneTimeServingRanges: getStructList(
          data['oneTimeServingRanges'],
          LocalDateTimeRangeStruct.fromMap,
        ),
      );

  static MenuOfferStruct? maybeFromMap(dynamic data) => data is Map
      ? MenuOfferStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'basePrice': _basePrice?.toMap(),
        'parts': _parts?.map((e) => e.toMap()).toList(),
        'recurringServingRanges':
            _recurringServingRanges?.map((e) => e.toMap()).toList(),
        'oneTimeServingRanges':
            _oneTimeServingRanges?.map((e) => e.toMap()).toList(),
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
        'basePrice': serializeParam(
          _basePrice,
          ParamType.DataStruct,
        ),
        'parts': serializeParam(
          _parts,
          ParamType.DataStruct,
          isList: true,
        ),
        'recurringServingRanges': serializeParam(
          _recurringServingRanges,
          ParamType.DataStruct,
          isList: true,
        ),
        'oneTimeServingRanges': serializeParam(
          _oneTimeServingRanges,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MenuOfferStruct fromSerializableMap(Map<String, dynamic> data) =>
      MenuOfferStruct(
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
        basePrice: deserializeStructParam(
          data['basePrice'],
          ParamType.DataStruct,
          false,
          structBuilder: MonetaryAmountStruct.fromSerializableMap,
        ),
        parts: deserializeStructParam<PartStruct>(
          data['parts'],
          ParamType.DataStruct,
          true,
          structBuilder: PartStruct.fromSerializableMap,
        ),
        recurringServingRanges: deserializeStructParam<WeekDayTimeRangeStruct>(
          data['recurringServingRanges'],
          ParamType.DataStruct,
          true,
          structBuilder: WeekDayTimeRangeStruct.fromSerializableMap,
        ),
        oneTimeServingRanges: deserializeStructParam<LocalDateTimeRangeStruct>(
          data['oneTimeServingRanges'],
          ParamType.DataStruct,
          true,
          structBuilder: LocalDateTimeRangeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MenuOfferStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MenuOfferStruct &&
        id == other.id &&
        name == other.name &&
        basePrice == other.basePrice &&
        listEquality.equals(parts, other.parts) &&
        listEquality.equals(
            recurringServingRanges, other.recurringServingRanges) &&
        listEquality.equals(oneTimeServingRanges, other.oneTimeServingRanges);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        basePrice,
        parts,
        recurringServingRanges,
        oneTimeServingRanges
      ]);
}

MenuOfferStruct createMenuOfferStruct({
  String? id,
  String? name,
  MonetaryAmountStruct? basePrice,
}) =>
    MenuOfferStruct(
      id: id,
      name: name,
      basePrice: basePrice ?? MonetaryAmountStruct(),
    );
