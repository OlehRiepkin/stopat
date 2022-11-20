import 'package:flutter/material.dart';
import 'package:stopat/widgets/app_text.dart';
import 'package:stopat/widgets/centered_stopwatch.dart';
import 'package:stopat/widgets/stopwatch_goal.dart';

class GameStateReadyToStart extends StatelessWidget {
  const GameStateReadyToStart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CenteredStopwatch(
      top: Center(
        child: StopwatchGoal(),
      ),
      bottom: Padding(
        padding: EdgeInsets.only(top: 16),
        child: AppText(
          'Ready? Tap to start timer',
          appTextSize: AppTextSize.small,
        ),
      ),
    );
  }
}
