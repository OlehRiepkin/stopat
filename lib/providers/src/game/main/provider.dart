part of providers;

final gameStateProvider = NotifierProvider<GameStateNotifier, GameState>(
  GameStateNotifier.new,
);

class GameStateNotifier extends Notifier<GameState> {
  Ticker? _ticker;
  late DateTime _startTime;

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
    _startTime = DateTime.now();

    _ticker = Ticker(
      (elapsed) {
        state = GameStateActive(
          stopwatchValue: _calculateDifference(
            start: _startTime,
            end: _startTime.add(elapsed),
          ),
        );
      },
    )..start();

    state = GameStateActive(stopwatchValue: 0);
  }

  void _stop() {
    final endTime = DateTime.now();
    _disposeTicker();

    final result = _calculateDifference(
      start: _startTime,
      end: endTime,
    );

    final gameSettings = ref.read(gameSettingsProvider);
    final temp = gameSettings.difficulty.format(result);
    final temp2 = gameSettings.difficulty.format(gameSettings.goal);
    final isWin = temp == temp2;

    state = GameStateFinished(
      stopwatchValue: result,
      isWin: isWin,
    );
  }

  void reset({
    bool delayed = false,
  }) {
    if (delayed) {
      Future.delayed(const Duration(seconds: 1)).then((_) {
        _disposeTicker();
        state = GameStateReadyToStart();
      });
      return;
    }

    _disposeTicker();
    state = GameStateReadyToStart();
  }

  void _disposeTicker() {
    _ticker?.stop();
    _ticker?.dispose();
    _ticker = null;
  }

  int _calculateDifference({
    required DateTime start,
    required DateTime end,
  }) =>
      end.difference(start).inMilliseconds;
}
