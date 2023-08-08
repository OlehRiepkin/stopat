import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/utils/localization.dart';

class GoalView extends ConsumerWidget {
  const GoalView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(gameSettingsProvider);
    final value = settings.value;
    if (value == null) {
      return const SizedBox.shrink();
    }
    final goalStr = value.difficulty.format(value.goal);
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
