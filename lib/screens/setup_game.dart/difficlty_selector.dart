import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/theme/theme.dart';
import 'package:stopat/utils/localization.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';
import 'package:stopat/widgets/buttons/touchable.dart';

class DifficultySelector extends ConsumerWidget {
  const DifficultySelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(gameSettingsProvider);

    final textColor = TCColors.of(context).buttonText;

    final inactiveFontSize = 16.w(context);
    final activeFontSize = 20.w(context);

    return Column(
      children: [
        Text(
          ls(LK.screen_setupGame_difficulty),
          style: TextStyle(
            color: textColor,
            fontFamily: 'Raleway',
            fontSize: 14.w(context),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: GameDifficulty.uiOrdered.map(
            (difficulty) {
              final isActive = settings.value?.difficulty == difficulty;
              return Touchable(
                props: TouchableProps(
                  onTap: () {
                    ref
                        .read(gameSettingsProvider.notifier)
                        .setDifficulty(difficulty);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16.w(context)),
                    child: Text(
                      difficulty.displayTitle,
                      style: TextStyle(
                        color: textColor,
                        fontFamily: 'Raleway',
                        fontWeight:
                            isActive ? FontWeight.w700 : FontWeight.w400,
                        fontSize: isActive ? activeFontSize : inactiveFontSize,
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
