import 'package:flutter/material.dart';

enum AppTextSize {
  /// 50%
  smallest,

  /// 75%
  small,

  /// 100%
  normal,

  /// 150%
  larger,

  /// 200%
  largest,

  /// 300%
  extraLarge;

  double getSize() {
    const normal = 16.0;

    switch (this) {
      case AppTextSize.smallest:
        return normal * 0.5;
      case AppTextSize.small:
        return normal * 0.75;
      case AppTextSize.normal:
        return normal;
      case AppTextSize.larger:
        return normal * 1.5;
      case AppTextSize.largest:
        return normal * 2;
      case AppTextSize.extraLarge:
        return normal * 3;
    }
  }
}

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    this.appTextSize = AppTextSize.normal,
    this.color,
    this.fontFamily,
    super.key,
  });

  final String data;
  final AppTextSize appTextSize;
  final Color? color;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: appTextSize.getSize(),
        color: color ?? Colors.white,
        fontFamily: fontFamily,
      ),
    );
  }
}
