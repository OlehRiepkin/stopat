import 'package:flutter/material.dart';
import 'package:stopat/widgets/stopwatch_display.dart';

class CenteredStopwatch extends StatelessWidget {
  const CenteredStopwatch({
    this.top,
    this.bottom,
    super.key,
  });

  final Widget? top;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: top ?? const SizedBox.shrink(),
        ),
        const StopwatchDisplay(),
        Expanded(
          child: bottom ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
