part of providers;

abstract class GameState {
  int get stopwatchValue;

  static T handler<T>(
    GameState state, {
    required T Function(GameStateReadyToStart state) onReadyToStart,
    required T Function(GameStateActive state) onActive,
    required T Function(GameStateFinished state) onFinished,
  }) {
    if (state is GameStateReadyToStart) {
      return onReadyToStart(state);
    }

    if (state is GameStateActive) {
      return onActive(state);
    }

    if (state is GameStateFinished) {
      return onFinished(state);
    }

    throw Exception('Unknown GameState');
  }
}

class GameStateReadyToStart extends GameState {
  @override
  int get stopwatchValue => 0;
}

class GameStateActive extends GameState {
  GameStateActive({
    required this.stopwatchValue,
  });

  @override
  final int stopwatchValue;
}

class GameStateFinished extends GameState {
  GameStateFinished({
    required this.stopwatchValue,
    required this.isWin,
  });

  @override
  final int stopwatchValue;

  final bool isWin;
}
