part of theme;

class AllColors {
  AllColors._();

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static const darkPrimary = Color(0xFF00001e);
  static const cyan = Color(0xFF00ffff);

  static const c0 = Color(0xFF000066);
  static const c1 = Color(0xFF001247);
  static const c2 = Color(0xFFbfcfff);
  static const c3 = Color(0xFF809fff);
}

class AppThemeData {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        const TCColors(
          buttonText: AllColors.c0,
          buttonBorder: AllColors.c2,
          buttonShadow: AllColors.cyan,
          frame: AllColors.c1,
          iconButton: AllColors.c0,
        ),
      ],
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        const TCColors(
          buttonText: AllColors.white,
          buttonBorder: AllColors.white,
          buttonShadow: AllColors.cyan,
          frame: AllColors.c3,
          iconButton: AllColors.white,
        ),
      ],
      scaffoldBackgroundColor: AllColors.darkPrimary,
    );
  }
}
