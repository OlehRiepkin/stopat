import 'package:flutter/material.dart';
import 'package:stopat/services/game_service.dart';
import 'package:stopat/widgets/game_state/builder.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          GameService().actionTap();
        },
        child: const SafeArea(
          child: SizedBox.expand(
            child: GameStateBuilder(),
          ),
        ),
      ),
    );
  }
}
