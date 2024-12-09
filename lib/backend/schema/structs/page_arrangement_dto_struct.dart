// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PageArrangementDtoStruct extends BaseStruct {
  PageArrangementDtoStruct({
    String? id,
    bool? primaryPage,
    List<SectionDtoStruct>? sections,
  })  : _id = id,
        _primaryPage = primaryPage,
        _sections = sections;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "primaryPage" field.
  bool? _primaryPage;
  bool get primaryPage => _primaryPage ?? false;
  set primaryPage(bool? val) => _primaryPage = val;

  bool hasPrimaryPage() => _primaryPage != null;

  // "sections" field.
  List<SectionDtoStruct>? _sections;
  List<SectionDtoStruct> get sections => _sections ?? const [];
  set sections(List<SectionDtoStruct>? val) => _sections = val;

  void updateSections(Function(List<SectionDtoStruct>) updateFn) {
    updateFn(_sections ??= []);
  }

  bool hasSections() => _sections != null;

  static PageArrangementDtoStruct fromMap(Map<String, dynamic> data) =>
      PageArrangementDtoStruct(
        id: data['id'] as String?,
        primaryPage: data['primaryPage'] as bool?,
        sections: getStructList(
          data['sections'],
          SectionDtoStruct.fromMap,
        ),
      );

  static PageArrangementDtoStruct? maybeFromMap(dynamic data) => data is Map
      ? PageArrangementDtoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'primaryPage': _primaryPage,
        'sections': _sections?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'primaryPage': serializeParam(
          _primaryPage,
          ParamType.bool,
        ),
        'sections': serializeParam(
          _sections,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PageArrangementDtoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PageArrangementDtoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        primaryPage: deserializeParam(
          data['primaryPage'],
          ParamType.bool,
          false,
        ),
        sections: deserializeStructParam<SectionDtoStruct>(
          data['sections'],
          ParamType.DataStruct,
          true,
          structBuilder: SectionDtoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PageArrangementDtoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PageArrangementDtoStruct &&
        id == other.id &&
        primaryPage == other.primaryPage &&
        listEquality.equals(sections, other.sections);
  }

  @override
  int get hashCode => const ListEquality().hash([id, primaryPage, sections]);
}

PageArrangementDtoStruct createPageArrangementDtoStruct({
  String? id,
  bool? primaryPage,
}) =>
    PageArrangementDtoStruct(
      id: id,
      primaryPage: primaryPage,
    );
