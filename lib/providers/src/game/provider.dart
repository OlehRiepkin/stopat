part of providers;

final gameStateProvider = NotifierProvider<GameStateNotifier, GameState>(
  GameStateNotifier.new,
);

class GameStateNotifier extends Notifier<GameState> {
  @override
  GameState build() {
    return GameStateReadyToStart();
  }

  void toggleState() {
    GameState.handler(
      state,
      onReadyToStart: (_) => _start(),
      onActive: (_) => _stop(),
      onFinished: (_) => reset(),
    );
  }

  void _start() {
    state = GameStateActive();
  }

  void _stop() {
    state = GameStateFinished();
  }

  void reset({
    bool delayed = false,
  }) {
    if (delayed) {
      Future.delayed(const Duration(seconds: 1)).then((_) {
        state = GameStateReadyToStart();
      });
      return;
    }

    state = GameStateReadyToStart();
  }
}
