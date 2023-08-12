import 'package:flutter/material.dart';
import 'package:stopat/screens/game/action_button.dart';
import 'package:stopat/screens/game/goal_view.dart';
import 'package:stopat/screens/game/stopwatch_view.dart';
import 'package:stopat/widgets/buttons/tc_icon_button.dart';
import 'package:stopat/widgets/tc_screen.dart';
import 'package:stopat/widgets/tc_screen_header.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();

  static void show(Widget parent, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const GameScreen();
        },
      ),
    );
  }
}

class _GameScreenState extends State<GameScreen> {
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
      child: const Column(
        children: [
          GoalView(),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: StopwatchView(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 64.0),
            child: ActionButton(),
          ),
        ],
      ),
    );
  }

  void _onCloseTap() {
    Navigator.of(context).pop();
    // Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
