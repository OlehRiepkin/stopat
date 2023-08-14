part of providers;

final gameSettingsProvider =
    NotifierProvider<GameSettingsNotifier, GameSettings>(
  GameSettingsNotifier.new,
);

class GameSettingsNotifier extends Notifier<GameSettings> {
  @override
  GameSettings build() {
    return GameSettings(
      goal: 10000,
      difficulty: GameDifficulty.normal,
    );
  }

  void setGoal(int goal) {
    state = state.copyWith(
      goal: goal,
    );
  }

  void setDifficulty(GameDifficulty difficulty) {
    state = state.copyWith(
      difficulty: difficulty,
    );
  }
}
