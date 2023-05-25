import 'package:flutter/material.dart';
import 'package:stopat/widgets/app_text.dart';

class GameStateInitial extends StatelessWidget {
  const GameStateInitial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppText(
        'Tap anywhere to create new game',
        appTextSize: AppTextSize.normal,
      ),
    );
  }
}
