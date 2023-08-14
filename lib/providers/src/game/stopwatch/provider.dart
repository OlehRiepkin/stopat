part of providers;

final stopwatchProvider = NotifierProvider<StopwatchStateNotifier, int>(
  StopwatchStateNotifier.new,
);

class StopwatchStateNotifier extends Notifier<int> {
  Ticker? _ticker;

  late DateTime _startTime;
  late DateTime _endTime;

  int get _difference => _endTime.difference(_startTime).inMilliseconds;

  @override
  int build() {
    ref.listen(gameStateProvider, (previous, next) {
      switch (next) {
        case GameState.readyToStart:
          reset();
          break;
        case GameState.active:
          start();
          break;
        case GameState.finished:
          stop();
          break;
      }
    });

    return 0;
  }

  void start() {
    _startTime = DateTime.now();
    final difficulty = ref.read(gameSettingsProvider).value?.difficulty;
    if (difficulty == null) {
      return;
    }

    _ticker = Ticker(
      (elapsed) {
        state = _startTime.add(elapsed).difference(_startTime).inMilliseconds;
      },
    )..start();
  }

  void stop() {
    _endTime = DateTime.now();
    _disposeTicker();

    state = _difference;
  }

  void reset() {
    state = 0;
    _disposeTicker();
  }

  void _disposeTicker() {
    _ticker?.stop();
    _ticker?.dispose();
    _ticker = null;
  }
}
