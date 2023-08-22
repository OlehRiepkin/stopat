import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';

class StopwatchView extends ConsumerWidget {
  const StopwatchView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final gameState = ref.watch(gameStateProvider);

        // return Column(
        //   children: GameDifficulty.uiOrdered
        //       .map(
        //         (d) => Text(
        //           d.format(value),
        //           style: const TextStyle(
        //             fontFamily: 'Digital',
        //             fontSize: 68,
        //           ),
        //         ),
        //       )
        //       .toList(),
        // );

        return Text(
          gameSettings.difficulty.format(gameState.stopwatchValue),
          style: TextStyle(
            fontFamily: 'Digital',
            fontSize: 100.w(context),
          ),
        );
      },
    );
  }
}
