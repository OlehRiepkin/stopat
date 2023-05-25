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

  // Variables
  // Timer? _timer;
  Ticker? _ticker;
  int _currentValueMs = 0;

  // Getters
  String get goalDisplay => _format(goalMs.value);

  // Main
  void _generateNewGoal() {
    _clear();
    goalMs.value = 5000;
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
    _ticker = Ticker(
      (elapsed) {
        _currentValueMs = elapsed.inMilliseconds;
        stopwatchDisplay.value = _format(_currentValueMs);
      },
    )..start();
    state.value = GameState.active;
  }

  void _stop() {
    _ticker?.stop();
    _ticker?.dispose();
    _ticker = null;

    _checkResult();
  }

  int get difference => _currentValueMs - goalMs.value;
  String get differenceDisplay => _format(difference);

  void _checkResult() {
    state.value = GameState.result;
  }

  // Helpers
  String _format(int value) {
    return (value / 1000).toStringAsFixed(3);
  }
}
