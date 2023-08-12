import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TCBackground extends StatelessWidget {
  const TCBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Lottie.asset(
            'assets/lottie/bg_anim.json',
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}
