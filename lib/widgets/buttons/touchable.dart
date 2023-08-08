import 'package:flutter/material.dart';

class TouchableProps {
  TouchableProps({
    required this.child,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
  });

  final Widget child;
  final VoidCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final VoidCallback? onTapCancel;
}

class Touchable extends StatelessWidget {
  const Touchable({
    required this.props,
    super.key,
  });

  final TouchableProps props;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: props.onTap,
      onTapDown: props.onTapDown,
      onTapUp: props.onTapUp,
      onTapCancel: props.onTapCancel,
      child: props.child,
    );
  }
}
