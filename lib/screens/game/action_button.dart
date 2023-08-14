import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/theme/theme.dart';
import 'package:stopat/utils/localization.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';
import 'package:stopat/widgets/buttons/touchable.dart';

class ActionButton extends ConsumerWidget {
  const ActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(stopwatchProvider);
    final title = ls(LK.screen_game_cta_start);
    final side = 100.w(context);

    return Touchable(
      props: TouchableProps(
        child: Container(
          height: side,
          width: side,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: TCColors.of(context).buttonBorder,
              ),
            boxShadow: [
              BoxShadow(
                color: TCColors.of(context).buttonStart,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: TCColors.of(context).buttonText,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Raleway',
                  fontSize: 18.w(context),
                ),
            ),
          ),
        ),
        onTap: () {
          ref.read(stopwatchProvider.notifier).toggleTimer();
        },
      ),
    );
  }
}
