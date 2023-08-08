import 'package:flutter/material.dart';
import 'package:stopat/screens/game/screen.dart';
import 'package:stopat/screens/home/setup_game/difficlty_selector.dart';
import 'package:stopat/widgets/buttons/touchable.dart';

class SetupGameModal extends StatelessWidget {
  const SetupGameModal({
    super.key,
  });

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const SetupGameModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DifficultySelector(),
        Touchable(
          props: TouchableProps(
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.play_arrow_outlined),
            ),
            onTap: () {
              Navigator.of(context).pop();

              GameScreen.show(context);
            },
          ),
        ),
      ],
    );
  }
}
