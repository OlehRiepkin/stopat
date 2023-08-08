extension EnumHelpers on Enum {
  static T? valueFromString<T extends Enum>(String? key, Iterable<T> values) {
    return values.asNameMap()[key];
  }
}
