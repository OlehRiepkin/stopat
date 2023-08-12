import 'package:flutter/material.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';

class BottomSpacer extends StatelessWidget {
  const BottomSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128.h(context),
    );
  }
}
