import 'package:flutter/material.dart';
import 'package:stopat/widgets/app_text.dart';
import 'package:stopat/widgets/centered_stopwatch.dart';
import 'package:stopat/widgets/stopwatch_goal.dart';

@Deprecated('')
class GameStateActive extends StatelessWidget {
  const GameStateActive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CenteredStopwatch(
      top: Center(child: StopwatchGoal()),
      bottom: Padding(
        padding: EdgeInsets.only(top: 16),
        child: AppText(
          'Tap anywhere to stop timer',
          appTextSize: AppTextSize.small,
        ),
      ),
    );
  }
}
