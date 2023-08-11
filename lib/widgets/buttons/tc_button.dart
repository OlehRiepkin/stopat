import 'package:flutter/material.dart';
import 'package:stopat/theme/theme.dart';
import 'package:stopat/utils/scale_helper/flutter_scale_helper.dart';
import 'package:stopat/widgets/buttons/touchable_opacity.dart';

class TCButton extends StatelessWidget {
  const TCButton({
    required this.title,
    required this.onTap,
    this.height = 40,
    this.width = 200,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    print('render button');
    final height = this.height.w(context);
    final width = this.width.w(context);

    return SizedBox(
      height: height,
      width: width,
      child: TouchableOpacity(
        props: TouchableOpacityProps(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(
                color: TCColors.of(context).buttonBorder,
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: TCColors.of(context).buttonText.withOpacity(0.15),
              //     blurRadius: 10,
              //     spreadRadius: 5,
              //   ),
              //   BoxShadow(
              //     color: TCColors.of(context).buttonBorder,
              //     blurRadius: 20,
              //     spreadRadius: -10,
              //   ),
              // ],
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: TCColors.of(context).buttonText,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Raleway',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
