part of providers;

final stopwatchProvider = NotifierProvider<StopwatchState, int>(
  StopwatchState.new,
);

class StopwatchState extends Notifier<int> {
  Ticker? _ticker;

  late DateTime start;
  late DateTime end;

  int get _difference => end.difference(start).inMilliseconds;

  @override
  int build() {
    return 0;
  }

  void toggleTimer() {
    _ticker == null ? _start() : _stop();
  }

  void _start() {
    start = DateTime.now();
    final difficulty = ref.read(gameSettingsProvider).value?.difficulty;
    if (difficulty == null) {
      return;
    }

    _ticker = Ticker(
      (elapsed) {
        state = start.add(elapsed).difference(start).inMilliseconds;
      },
    )..start();
  }

  void _stop() {
    end = DateTime.now();
    _ticker?.stop();
    _ticker?.dispose();
    _ticker = null;

    state = _difference;
  }
}
