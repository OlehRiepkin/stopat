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
    final height = this.height.w(context);
    final width = this.width.w(context);

    return SizedBox(
      height: height,
      width: width,
      child: TouchableOpacity(
        props: TouchableOpacityProps(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: TCColors.of(context).buttonBorder,
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                TCShadow.cyanShadow(context),                
              ],
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: TCColors.of(context).buttonText,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Raleway',
                  fontSize: 16.w(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
