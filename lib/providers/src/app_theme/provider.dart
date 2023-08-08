part of providers;

final appThemeProvider = AsyncNotifierProvider<AppThemeState, ThemeMode>(
  AppThemeState.new,
);

class AppThemeState extends AsyncNotifier<ThemeMode> {
  @override
  FutureOr<ThemeMode> build() async {
    final themeModeStr = ref.watch(sharedPreferencesProvider).getString(
          TCSharedPreference.themeMode.key,
        );

    return EnumHelpers.valueFromString(themeModeStr, ThemeMode.values) ??
        ThemeMode.light;
  }

  void toggleTheme() {
    final newThemeMode =
        state.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state = AsyncValue.data(
      newThemeMode,
    );

    _saveToSharedPreferences(newThemeMode);
  }

  Future<bool> _saveToSharedPreferences(ThemeMode themeMode) {
    return ref.read(sharedPreferencesProvider).setString(
          TCSharedPreference.themeMode.key,
          themeMode.name,
        );
  }
}
