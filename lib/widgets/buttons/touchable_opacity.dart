import 'package:flutter/material.dart';
import 'package:stopat/widgets/buttons/touchable.dart';

class TouchableOpacityProps extends TouchableProps {
  TouchableOpacityProps({
    required super.child,
    this.activeOpacity = 0.2,
    super.onTap,
    super.onTapDown,
    super.onTapUp,
    super.onTapCancel,
  });

  final double activeOpacity;
}

class TouchableOpacity extends StatelessWidget {
  const TouchableOpacity({
    required this.props,
    super.key,
  });

  final TouchableOpacityProps props;

  @override
  Widget build(BuildContext context) {
    return Touchable(
      props: props,
    );
  }
}
