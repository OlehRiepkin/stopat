import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/theme/theme.dart';
import 'package:stopat/utils/localization.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';

class GoalView extends ConsumerWidget {
  const GoalView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final goalStr = gameSettings.difficulty.format(gameSettings.goal);
    return Column(
      children: [
        Text(
          ls(
            LK.screen_game_goalDesc,
            namedArgs: {
              'goal': goalStr,
            },
          ),
          style: TextStyle(
            color: TCColors.of(context).text,
            fontWeight: FontWeight.w500,
            fontFamily: 'Raleway',
            fontSize: 18.w(context),
          ),
        ),
      ],
    );
  }
}
