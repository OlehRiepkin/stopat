part of providers;

enum TCSharedPreference {
  themeMode;

  String get key => switch (this) {
        _ => name,
      };

  static TCSharedPreference? fromString(String? key) =>
      TCSharedPreference.values.firstWhereOrNull(
        (e) => e.key == key,
      );
}
