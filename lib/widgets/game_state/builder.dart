import 'package:flutter/material.dart';
import 'package:stopat/observable/observable.dart';
import 'package:stopat/services/game_service.dart';
import 'package:stopat/widgets/game_state/state_active.dart';
import 'package:stopat/widgets/game_state/state_initial.dart';
import 'package:stopat/widgets/game_state/state_ready_to_start.dart';
import 'package:stopat/widgets/game_state/state_result.dart';

@Deprecated('')
class GameStateBuilder extends StatelessWidget {
  const GameStateBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      GameService().state,
      builder: (BuildContext context, GameState gameState) {
        switch (gameState) {
          case GameState.initial:
            return const GameStateInitial();
          case GameState.readyToStart:
            return const GameStateReadyToStart();
          case GameState.active:
            return const GameStateActive();
          case GameState.result:
            return const GameStateResult();
        }
      },
    );
  }
}
