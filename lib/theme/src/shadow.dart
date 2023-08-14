part of theme;

abstract class TCShadow {
  static BoxShadow cyanShadow(BuildContext context) => BoxShadow(
        color: TCColors.of(context).buttonShadow,
        blurRadius: 10,
        spreadRadius: 2,
      );
}
