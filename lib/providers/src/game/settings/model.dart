part of providers;

class GameSettings {
  GameSettings({
    required this.goal,
    required this.difficulty,
  });

  /// Value must be in milliseconds
  final int goal;
  final GameDifficulty difficulty;

  GameSettings copyWith({
    int? goal,
    GameDifficulty? difficulty,
  }) {
    return GameSettings(
      goal: goal ?? this.goal,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  @override
  String toString() => 'GameSettings(goal: $goal, difficulty: $difficulty)';
}
