import 'package:flutter/material.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';

class TCScreenHeaderProps {
  TCScreenHeaderProps({
    this.left,
    this.right,
  });

  final WidgetBuilder? left;
  final WidgetBuilder? right;
}

class TCScreenHeader extends StatelessWidget {
  const TCScreenHeader({
    required this.props,
    super.key,
  });

  final TCScreenHeaderProps props;

  @override
  Widget build(BuildContext context) {
    final left = props.left;
    final right = props.right;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 40.w(context),
      ),
      child: Row(
        children: [
          if (left != null) left(context),
          const Spacer(),
          if (right != null) right(context),
        ],
      ),
    );
  }
}
