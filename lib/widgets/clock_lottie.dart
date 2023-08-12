import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stopat/providers/providers.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';

class ClockLottieView extends ConsumerWidget {
  const ClockLottieView({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    final asset = switch (theme.value) {
      ThemeMode.dark => 'assets/lottie/clock_anim_white.json',
      ThemeMode.light || _ => 'assets/lottie/clock_anim.json',
    };

    return Lottie.asset(
      asset,
      fit: BoxFit.contain,
      width: width ?? 180.w(context),
      height: height ?? 180.w(context),
    );
  }
}
