part of providers;

final gameSettingsProvider =
    AsyncNotifierProvider<GameSettingsState, GameSettings>(
  GameSettingsState.new,
);

class GameSettingsState extends AsyncNotifier<GameSettings> {
  @override
  FutureOr<GameSettings> build() {
    return Future.value(
      GameSettings(
        goal: 3000,
        difficulty: GameDifficulty.normal,
      ),
    );
  }

  Future<void> setGoal(int goal) async {
    final currentValue = state.value;
    if (currentValue == null) {
      return;
    }

    state = AsyncValue.data(
      currentValue.copyWith(
        goal: goal,
      ),
    );
  }

  Future<void> setDifficulty(GameDifficulty difficulty) async {
    final currentValue = state.value;
    if (currentValue == null) {
      return;
    }

    state = AsyncValue.data(
      currentValue.copyWith(
        difficulty: difficulty,
      ),
    );
  }
}
