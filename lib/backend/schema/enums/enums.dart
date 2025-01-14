import 'package:collection/collection.dart';

enum ActionType {
  DELETE,
  UPDATE,
  CREATE,
  NONE,
}

enum SectionElementSourceElementType {
  PLACE,
  PLACE_TYPE,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ActionType):
      return ActionType.values.deserialize(value) as T?;
    case (SectionElementSourceElementType):
      return SectionElementSourceElementType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
