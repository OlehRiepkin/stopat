part of theme;

class AllColors {
  AllColors._();

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static const darkPrimary = Color(0xFF00001e);
  static const cyan = Color(0x4c00FFFF);
  static const green = Color(0xFF7ED454);
  static const red = Color(0xFF7ED454);
}

class AppThemeData {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        TCColors(
          buttonText: AllColors.darkPrimary,
          buttonBorder: AllColors.darkPrimary.withOpacity(0.5),
          buttonShadow: AllColors.cyan,
          buttonStart: AllColors.green,
          buttonStop: AllColors.red,
          frame: Colors.red,
          iconButton: AllColors.darkPrimary,
        ),
      ],
      scaffoldBackgroundColor: AllColors.white,
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        const TCColors(
          buttonText: AllColors.white,
          buttonBorder: AllColors.white,
          buttonShadow: AllColors.cyan,
          buttonStart: AllColors.green,
          buttonStop: AllColors.red,
          frame: Colors.red,
          iconButton: AllColors.white,
        ),
      ],
      scaffoldBackgroundColor: AllColors.darkPrimary,
    );
  }
}
