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

    final colors = TCColors.of(context);

    final textColor = colors.buttonText;

    final activeFontSize = 16.w(context);
    final inactiveFontSize = 16.w(context);

    const activeFontWeight = FontWeight.w400;
    const inactiveFontWeight = FontWeight.w400;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: TCColors.of(context).buttonBorder,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.w(context)),
            child: Text(
              ls(LK.screen_setupGame_difficulty),
              style: TextStyle(
                color: textColor,
                fontFamily: 'Raleway',
                fontSize: 14.w(context),
              ),
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
                      padding: EdgeInsets.all(8.w(context)),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: isActive
                              ? [
                                  TCShadow.cyanShadow(context),
                                ]
                              : null,
                              borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w(context),
                          vertical: 4.w(context),
                        ),
                        child: Text(
                          difficulty.displayTitle,
                          style: TextStyle(
                            color: textColor,
                            fontFamily: 'Raleway',
                            fontWeight: isActive
                                ? activeFontWeight
                                : inactiveFontWeight,
                            fontSize:
                                isActive ? activeFontSize : inactiveFontSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
