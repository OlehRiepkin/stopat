import 'package:flutter/material.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/widgets/buttons/touchable.dart';

class ActionButton extends ConsumerWidget {
  const ActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: Colors.lightGreen,
      child: Touchable(
        props: TouchableProps(
          child: const Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              'action',
            ),
          ),
          onTap: () {
            ref.read(stopwatchProvider.notifier).toggleTimer();
          },
        ),
      ),
    );
  }
}
