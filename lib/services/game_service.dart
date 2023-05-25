import 'package:flutter/scheduler.dart';
import 'package:stopat/observable/observable.dart';

enum GameState {
  initial,
  readyToStart,
  active,
  result,
}

class GameService {
  // Singleton
  factory GameService() {
    return _instance;
  }
  GameService._internal();
  static final GameService _instance = GameService._internal();

  // Obsrevable
  final state = Observable<GameState>(GameState.initial);
  late final stopwatchDisplay = Observable<String?>(_format(_currentValueMs));
  final goalMs = Observable<int>(0);

  // final start = Observable<DateTime>(DateTime.now());
  // final end = Observable<DateTime>(DateTime.now());
  var start = DateTime.now();
  var end = DateTime.now();

  // Variables
  // Timer? _timer;
  Ticker? _ticker;
  int _currentValueMs = 0;

  // Getters
  String get goalDisplay => _format(goalMs.value);

  // Main
  void _generateNewGoal() {
    _clear();
    goalMs.value = 3000;
    state.value = GameState.readyToStart;
  }

  void actionTap() {
    switch (state.value) {
      case GameState.initial:
        _generateNewGoal();
        break;
      case GameState.readyToStart:
        _start();
        break;
      case GameState.active:
        _stop();
        break;
      case GameState.result:
        _clear();
        state.value = GameState.readyToStart;
        break;
    }
  }

  void _clear() {
    stopwatchDisplay.value = _format(_currentValueMs = 0);
  }

  void _start() {
    start = DateTime.now();
    _ticker = Ticker(
      (elapsed) {
        _currentValueMs = start.add(elapsed).difference(start).inMilliseconds;
        stopwatchDisplay.value = _format(_currentValueMs);
      },
    )..start();
    state.value = GameState.active;
  }

  void _stop() {
    end = DateTime.now();
    _ticker?.stop();
    _ticker?.dispose();
    _ticker = null;

    stopwatchDisplay.value = _format(difference);

    _checkResult();
  }

  int get difference => end.difference(start).inMilliseconds;
  int get deviation => difference - goalMs.value;
  String get deviationDisplay => _format(deviation);

  void _checkResult() {
    state.value = GameState.result;
  }

  // Helpers
  String _format(int value) {
    return (value / 1000).toStringAsFixed(3);
  }
}
