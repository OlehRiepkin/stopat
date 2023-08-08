import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';

class StopwatchView extends ConsumerWidget {
  const StopwatchView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final difficulty = ref.watch(gameSettingsProvider).value?.difficulty;
    if (difficulty == null) {
      return const SizedBox.shrink();
    }

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final value = ref.watch(stopwatchProvider);

        return Column(
          children: GameDifficulty.uiOrdered
              .map(
                (d) => Text(
                  d.format(value),
                  style: const TextStyle(
                    fontFamily: 'Digital',
                    fontSize: 68,
                  ),
                ),
              )
              .toList(),
        );

        return Text(
          difficulty.format(value),
          style: const TextStyle(
            fontFamily: 'Digital',
            fontSize: 68,
          ),
        );
      },
    );
  }
}
