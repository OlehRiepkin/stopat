import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/widgets/buttons/touchable.dart';

class DifficultySelector extends ConsumerWidget {
  const DifficultySelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(gameSettingsProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: GameDifficulty.uiOrdered
          .map(
            (difficulty) => Touchable(
              props: TouchableProps(
                onTap: () {
                  ref
                      .read(gameSettingsProvider.notifier)
                      .setDifficulty(difficulty);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    difficulty.displayTitle,
                    style: TextStyle(
                      color: settings.value?.difficulty == difficulty
                          ? Colors.red
                          : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
