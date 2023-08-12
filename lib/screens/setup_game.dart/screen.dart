import 'package:flutter/material.dart';
import 'package:stopat/screens/game/screen.dart';
import 'package:stopat/screens/setup_game.dart/difficlty_selector.dart';
import 'package:stopat/utils/localization.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';
import 'package:stopat/widgets/buttons/tc_button.dart';
import 'package:stopat/widgets/buttons/tc_icon_button.dart';
import 'package:stopat/widgets/tc_screen.dart';
import 'package:stopat/widgets/tc_screen_header.dart';

class SetupGameScreen extends StatefulWidget {
  const SetupGameScreen({
    super.key,
  });

  @override
  State<SetupGameScreen> createState() => _SetupGameScreenState();

  static void show(Widget parent, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const SetupGameScreen();
        },
      ),
    );
  }
}

class _SetupGameScreenState extends State<SetupGameScreen> {
  @override
  Widget build(BuildContext context) {
    return TCScreen(
      headerProps: TCScreenHeaderProps(
        right: (context) {
          return TCIconButton(
            props: TCIconButtonProps.close(
              onTap: _onCloseTap,
            ),
          );
        },
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DifficultySelector(),
          SizedBox(height: 32.w(context)),
          TCButton(
            title: ls(LK.screen_home_btnCustom),
            onTap: _onStartTap,
          ),
        ],
      ),
    );
  }

  void _onCloseTap() {
    Navigator.of(context).pop();
  }

  void _onStartTap() {
    GameScreen.show(widget, context);
  }
}
