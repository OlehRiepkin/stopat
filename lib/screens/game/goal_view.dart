import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/utils/localization.dart';

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
        Text(goalStr),
        Text(
          ls(LK.screen_game_goalDesc),
        ),
      ],
    );
  }
}
