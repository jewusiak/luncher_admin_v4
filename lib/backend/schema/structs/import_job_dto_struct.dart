// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImportJobDtoStruct extends BaseStruct {
  ImportJobDtoStruct({
    String? id,
    String? status,
    String? errorDescription,
    String? notes,
    String? dateCreated,
    String? datePickedUp,
    String? dateFinished,
    String? dateCancelled,
    List<MenuOfferStruct>? result,
  })  : _id = id,
        _status = status,
        _errorDescription = errorDescription,
        _notes = notes,
        _dateCreated = dateCreated,
        _datePickedUp = datePickedUp,
        _dateFinished = dateFinished,
        _dateCancelled = dateCancelled,
        _result = result;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "errorDescription" field.
  String? _errorDescription;
  String get errorDescription => _errorDescription ?? '';
  set errorDescription(String? val) => _errorDescription = val;

  bool hasErrorDescription() => _errorDescription != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  // "dateCreated" field.
  String? _dateCreated;
  String get dateCreated => _dateCreated ?? '';
  set dateCreated(String? val) => _dateCreated = val;

  bool hasDateCreated() => _dateCreated != null;

  // "datePickedUp" field.
  String? _datePickedUp;
  String get datePickedUp => _datePickedUp ?? '';
  set datePickedUp(String? val) => _datePickedUp = val;

  bool hasDatePickedUp() => _datePickedUp != null;

  // "dateFinished" field.
  String? _dateFinished;
  String get dateFinished => _dateFinished ?? '';
  set dateFinished(String? val) => _dateFinished = val;

  bool hasDateFinished() => _dateFinished != null;

  // "dateCancelled" field.
  String? _dateCancelled;
  String get dateCancelled => _dateCancelled ?? '';
  set dateCancelled(String? val) => _dateCancelled = val;

  bool hasDateCancelled() => _dateCancelled != null;

  // "result" field.
  List<MenuOfferStruct>? _result;
  List<MenuOfferStruct> get result => _result ?? const [];
  set result(List<MenuOfferStruct>? val) => _result = val;

  void updateResult(Function(List<MenuOfferStruct>) updateFn) {
    updateFn(_result ??= []);
  }

  bool hasResult() => _result != null;

  static ImportJobDtoStruct fromMap(Map<String, dynamic> data) =>
      ImportJobDtoStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        errorDescription: data['errorDescription'] as String?,
        notes: data['notes'] as String?,
        dateCreated: data['dateCreated'] as String?,
        datePickedUp: data['datePickedUp'] as String?,
        dateFinished: data['dateFinished'] as String?,
        dateCancelled: data['dateCancelled'] as String?,
        result: getStructList(
          data['result'],
          MenuOfferStruct.fromMap,
        ),
      );

  static ImportJobDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? ImportJobDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'errorDescription': _errorDescription,
        'notes': _notes,
        'dateCreated': _dateCreated,
        'datePickedUp': _datePickedUp,
        'dateFinished': _dateFinished,
        'dateCancelled': _dateCancelled,
        'result': _result?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'errorDescription': serializeParam(
          _errorDescription,
          ParamType.String,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'dateCreated': serializeParam(
          _dateCreated,
          ParamType.String,
        ),
        'datePickedUp': serializeParam(
          _datePickedUp,
          ParamType.String,
        ),
        'dateFinished': serializeParam(
          _dateFinished,
          ParamType.String,
        ),
        'dateCancelled': serializeParam(
          _dateCancelled,
          ParamType.String,
        ),
        'result': serializeParam(
          _result,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ImportJobDtoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImportJobDtoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        errorDescription: deserializeParam(
          data['errorDescription'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        dateCreated: deserializeParam(
          data['dateCreated'],
          ParamType.String,
          false,
        ),
        datePickedUp: deserializeParam(
          data['datePickedUp'],
          ParamType.String,
          false,
        ),
        dateFinished: deserializeParam(
          data['dateFinished'],
          ParamType.String,
          false,
        ),
        dateCancelled: deserializeParam(
          data['dateCancelled'],
          ParamType.String,
          false,
        ),
        result: deserializeStructParam<MenuOfferStruct>(
          data['result'],
          ParamType.DataStruct,
          true,
          structBuilder: MenuOfferStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ImportJobDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ImportJobDtoStruct &&
        id == other.id &&
        status == other.status &&
        errorDescription == other.errorDescription &&
        notes == other.notes &&
        dateCreated == other.dateCreated &&
        datePickedUp == other.datePickedUp &&
        dateFinished == other.dateFinished &&
        dateCancelled == other.dateCancelled &&
        listEquality.equals(result, other.result);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        errorDescription,
        notes,
        dateCreated,
        datePickedUp,
        dateFinished,
        dateCancelled,
        result
      ]);
}

ImportJobDtoStruct createImportJobDtoStruct({
  String? id,
  String? status,
  String? errorDescription,
  String? notes,
  String? dateCreated,
  String? datePickedUp,
  String? dateFinished,
  String? dateCancelled,
}) =>
    ImportJobDtoStruct(
      id: id,
      status: status,
      errorDescription: errorDescription,
      notes: notes,
      dateCreated: dateCreated,
      datePickedUp: datePickedUp,
      dateFinished: dateFinished,
      dateCancelled: dateCancelled,
    );
