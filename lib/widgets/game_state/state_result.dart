import 'package:flutter/material.dart';
import 'package:stopat/services/game_service.dart';
import 'package:stopat/widgets/app_text.dart';
import 'package:stopat/widgets/centered_stopwatch.dart';
import 'package:stopat/widgets/stopwatch_goal.dart';

class GameStateResult extends StatelessWidget {
  const GameStateResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CenteredStopwatch(
      top: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                GameService().state.value = GameState.initial;
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
          ),
          const Center(
            child: StopwatchGoal(),
          ),
        ],
      ),
      bottom: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: AppText(
              'Tap to restart',
              appTextSize: AppTextSize.small,
            ),
          ),
          Expanded(
            child: Center(
              child: AppText(
                GameService().deviationDisplay,
                appTextSize: AppTextSize.larger,
                color: getColor(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getColor() {
    final diff = GameService().deviation;
    if (diff > 0) {
      return Colors.green;
    }
    if (diff < 0) {
      return Colors.red;
    }

    return Colors.blue;
  }
}
