import 'package:flutter/material.dart';
import 'package:stopat/theme/theme.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';

class TCFrame extends StatelessWidget {
  const TCFrame({
    required this.child,
    this.color,
    this.borderWidth = 2.0,
    this.verticalLineHeight,
    this.horizontalLineWidth,
    this.childOnTop = false,
    this.topLeft = true,
    this.topRight = true,
    this.bottomRight = true,
    this.bottomLeft = true,
    super.key,
  });

  final Widget child;
  final Color? color;
  final double borderWidth;
  final double? verticalLineHeight;
  final double? horizontalLineWidth;
  final bool childOnTop;
  final bool topLeft;
  final bool topRight;
  final bool bottomRight;
  final bool bottomLeft;

  @override
  Widget build(BuildContext context) {
    final horizontalLineWidth = this.horizontalLineWidth ?? 32.w(context);
    final verticalLineHeight = this.verticalLineHeight ?? 32.w(context);

    final content = Positioned.fill(
      child: child,
    );

    final color = this.color ?? TCColors.of(context).frame;

    final hTopLeft = topLeft
        ? Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: borderWidth,
              width: horizontalLineWidth,
              color: color,
            ),
          )
        : null;

    final vTopleft = topLeft
        ? Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: verticalLineHeight,
              width: borderWidth,
              color: color,
            ),
          )
        : null;

    final hTopRight = topRight
        ? Align(
            alignment: Alignment.topRight,
            child: Container(
              height: borderWidth,
              width: horizontalLineWidth,
              color: color,
            ),
          )
        : null;

    final vTopRight = topRight
        ? Align(
            alignment: Alignment.topRight,
            child: Container(
              height: verticalLineHeight,
              width: borderWidth,
              color: color,
            ),
          )
        : null;

    final hBottomRight = bottomRight
        ? Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: borderWidth,
              width: horizontalLineWidth,
              color: color,
            ),
          )
        : null;

    final vBottomRight = bottomRight
        ? Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: verticalLineHeight,
              width: borderWidth,
              color: color,
            ),
          )
        : null;

    final hBottomLeft = bottomLeft
        ? Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: borderWidth,
              width: horizontalLineWidth,
              color: color,
            ),
          )
        : null;

    final vBottomLeft = bottomLeft
        ? Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: verticalLineHeight,
              width: borderWidth,
              color: color,
            ),
          )
        : null;

    return Stack(
      children: [
        if (!childOnTop) content,
        if (hTopLeft != null) hTopLeft,
        if (hTopRight != null) hTopRight,
        if (hBottomRight != null) hBottomRight,
        if (hBottomLeft != null) hBottomLeft,
        if (vTopleft != null) vTopleft,
        if (vTopRight != null) vTopRight,
        if (vBottomRight != null) vBottomRight,
        if (vBottomLeft != null) vBottomLeft,
        if (childOnTop) content,
      ],
    );
  }
}
