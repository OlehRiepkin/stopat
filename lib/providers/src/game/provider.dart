part of providers;

final gameStateProvider = NotifierProvider<GameStateNotifier, GameState>(
  GameStateNotifier.new,
);

class GameStateNotifier extends Notifier<GameState> {
  @override
  GameState build() {
    return GameState.readyToStart;
  }

  void toggleState() {
    switch (state) {
      case GameState.readyToStart:
        _start();
        break;
      case GameState.active:
        _stop();
        break;
      case GameState.finished:
        _reset();
        break;
    }
  }

  void _start() {
    state = GameState.active;
  }

  void _stop() {
    state = GameState.finished;
  }

  void _reset() {
    state = GameState.readyToStart;
  }
}
