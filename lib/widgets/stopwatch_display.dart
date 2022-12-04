import 'package:flutter/material.dart';
import 'package:stopat/observable/observable.dart';
import 'package:stopat/services/game_service.dart';
import 'package:stopat/widgets/app_text.dart';

class StopwatchDisplay extends StatelessWidget {
  const StopwatchDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      GameService().stopwatchDisplay,
      builder: (BuildContext context, String? value) {
        if (value == null) {
          return const SizedBox.shrink();
        }

        return AppText(
          value,
          appTextSize: AppTextSize.extraLarge,
          fontFamily: 'Digital',
        );
      },
    );
  }
}
