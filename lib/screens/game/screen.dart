import 'package:flutter/material.dart';
import 'package:stopat/screens/game/action_button.dart';
import 'package:stopat/screens/game/goal_view.dart';
import 'package:stopat/screens/game/stopwatch_view.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';
import 'package:stopat/widgets/bottom_spacer.dart';
import 'package:stopat/widgets/buttons/tc_icon_button.dart';
import 'package:stopat/widgets/tc_screen.dart';
import 'package:stopat/widgets/tc_screen_header.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();

  static void show(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return const GameScreen();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
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
      child: Column(
        children: [
          const GoalView(),
          Padding(
            padding: EdgeInsets.all(32.w(context)),
            child: const StopwatchView(),
          ),
          const Spacer(),
          const ActionButton(),
          const BottomSpacer(),
        ],
      ),
    );
  }

  void _onCloseTap() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
