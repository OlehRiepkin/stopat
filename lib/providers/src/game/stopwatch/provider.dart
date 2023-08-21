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
      GameState.handler(
        next,
        onReadyToStart: (_) => reset(),
        onActive: (_) => start(),
        onFinished: (_) => stop(),
      );
    });

    return 0;
  }

  void start() {
    _startTime = DateTime.now();
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
