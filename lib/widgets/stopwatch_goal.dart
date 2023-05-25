import 'package:flutter/material.dart';
import 'package:stopat/observable/observable.dart';
import 'package:stopat/services/game_service.dart';
import 'package:stopat/widgets/app_text.dart';

class StopwatchGoal extends StatelessWidget {
  const StopwatchGoal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final service = GameService();
    return Observer(
      service.goalMs,
      builder: (BuildContext context, _) {
        final stopAt = service.goalDisplay;
        return AppText(
          'Stop timer at $stopAt',
          appTextSize: AppTextSize.larger,
        );
      },
    );
  }
}
