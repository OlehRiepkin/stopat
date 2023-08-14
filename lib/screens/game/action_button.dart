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
    final colors = TCColors.of(context);
    final gameState = ref.watch(gameStateProvider);

    final side = 200.w(context);

    final ActionButtonModel actionButtonModel = switch (gameState) {
      GameState.readyToStart => ActionButtonModel(
          text: ls(LK.screen_game_cta_start),
          shadowColor: colors.buttonStart,
          onTap: () {
            ref.read(gameStateProvider.notifier).toggleState();
          },
        ),
      GameState.active => ActionButtonModel(
          text: ls(LK.screen_game_cta_stop),
          shadowColor: colors.buttonStop,
          onTap: () {
            ref.read(gameStateProvider.notifier).toggleState();
          },
        ),
      GameState.finished => ActionButtonModel(
          text: ls(LK.screen_game_cta_reset),
          shadowColor: colors.buttonReset,
          onTap: () {
            ref.read(gameStateProvider.notifier).toggleState();
          },
        ),
    };

    return Touchable(
      props: TouchableProps(
        onTap: actionButtonModel.onTap,
        onTapDown: actionButtonModel.onTapDown,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: side,
          width: side,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: colors.buttonBorder,
            ),
            boxShadow: [
              BoxShadow(
                color: actionButtonModel.shadowColor,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              actionButtonModel.text,
              style: TextStyle(
                color: colors.text,
                fontWeight: FontWeight.w700,
                fontFamily: 'Raleway',
                fontSize: 18.w(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButtonModel {
  ActionButtonModel({
    required this.text,
    required this.shadowColor,
    this.onTap,
    this.onTapDown,
  });

  final String text;
  final Color shadowColor;
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
}
