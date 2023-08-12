import 'package:flutter/material.dart';
import 'package:stopat/theme/theme.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';

class TCIconButtonProps {
  const TCIconButtonProps({
    this.icon,
    this.onTap,
  });

  TCIconButtonProps.close({
    this.onTap,
  }) : icon = Icons.close_outlined;

  TCIconButtonProps.settings({
    this.onTap,
  }) : icon = Icons.settings_outlined;

  final IconData? icon;
  final VoidCallback? onTap;
}

class TCIconButton extends StatelessWidget {
  const TCIconButton({
    required this.props,
    super.key,
  });

  final TCIconButtonProps props;

  @override
  Widget build(BuildContext context) {
    final height = 40.w(context);

    return GestureDetector(
      onTap: props.onTap,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: height,
        width: height,
        child: Icon(
          props.icon,
          color: TCColors.of(context).iconButton,
          
        ),
      ),
    );
  }
}
