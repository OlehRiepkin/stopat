part of providers;

abstract class GameState {
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

class GameStateReadyToStart extends GameState {}

class GameStateActive extends GameState {}

class GameStateFinished extends GameState {}
