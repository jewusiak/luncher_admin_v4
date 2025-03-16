// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartStruct extends BaseStruct {
  PartStruct({
    String? id,
    String? name,
    MonetaryAmountStruct? supplement,
    List<OptionStruct>? options,
  })  : _id = id,
        _name = name,
        _supplement = supplement,
        _options = options;

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

  // "supplement" field.
  MonetaryAmountStruct? _supplement;
  MonetaryAmountStruct get supplement => _supplement ?? MonetaryAmountStruct();
  set supplement(MonetaryAmountStruct? val) => _supplement = val;

  void updateSupplement(Function(MonetaryAmountStruct) updateFn) {
    updateFn(_supplement ??= MonetaryAmountStruct());
  }

  bool hasSupplement() => _supplement != null;

  // "options" field.
  List<OptionStruct>? _options;
  List<OptionStruct> get options => _options ?? const [];
  set options(List<OptionStruct>? val) => _options = val;

  void updateOptions(Function(List<OptionStruct>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  static PartStruct fromMap(Map<String, dynamic> data) => PartStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        supplement: data['supplement'] is MonetaryAmountStruct
            ? data['supplement']
            : MonetaryAmountStruct.maybeFromMap(data['supplement']),
        options: getStructList(
          data['options'],
          OptionStruct.fromMap,
        ),
      );

  static PartStruct? maybeFromMap(dynamic data) =>
      data is Map ? PartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'supplement': _supplement?.toMap(),
        'options': _options?.map((e) => e.toMap()).toList(),
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
        'supplement': serializeParam(
          _supplement,
          ParamType.DataStruct,
        ),
        'options': serializeParam(
          _options,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PartStruct fromSerializableMap(Map<String, dynamic> data) =>
      PartStruct(
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
        supplement: deserializeStructParam(
          data['supplement'],
          ParamType.DataStruct,
          false,
          structBuilder: MonetaryAmountStruct.fromSerializableMap,
        ),
        options: deserializeStructParam<OptionStruct>(
          data['options'],
          ParamType.DataStruct,
          true,
          structBuilder: OptionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PartStruct &&
        id == other.id &&
        name == other.name &&
        supplement == other.supplement &&
        listEquality.equals(options, other.options);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, supplement, options]);
}

PartStruct createPartStruct({
  String? id,
  String? name,
  MonetaryAmountStruct? supplement,
}) =>
    PartStruct(
      id: id,
      name: name,
      supplement: supplement ?? MonetaryAmountStruct(),
    );
