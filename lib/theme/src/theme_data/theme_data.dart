part of theme;

class AllColors {
  AllColors._();

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static const darkPrimary = Color(0xFF00001e);
  static const cyan = Color(0x4c00FFFF);
  static const green = Color(0xFF7ED454);
  static const red = Color(0xFFF48181);
  // static const redLight = Color(0xFFF9C0C0);
  static const grey = Color(0xFFD9D9D9);
}

class AppThemeData {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        TCColors(
          text: AllColors.darkPrimary,
          buttonBorder: AllColors.darkPrimary.withOpacity(0.5),
          buttonShadow: AllColors.cyan,
          buttonStart: AllColors.green,
          buttonStop: AllColors.red,
          buttonReset: AllColors.grey,
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
          text: AllColors.white,
          buttonBorder: AllColors.white,
          buttonShadow: AllColors.cyan,
          buttonStart: AllColors.green,
          buttonStop: AllColors.red,
          buttonReset: AllColors.grey,
          frame: Colors.red,
          iconButton: AllColors.white,
        ),
      ],
      scaffoldBackgroundColor: AllColors.darkPrimary,
    );
  }
}
