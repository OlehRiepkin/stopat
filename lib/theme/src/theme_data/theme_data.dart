part of theme;

class AllColors {
  AllColors._();

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static const midnightBlue = Color(0xFF145DA0);
  static const darkBlue = Color(0xFF0C2D48);
  static const blue = Color(0xFF2E8BC0);
  static const babyBlue = Color(0xFFB1D4E0);

  static const c0 = Color(0xFF03045E);
  static const c1 = Color(0xFF023E8A);
  static const c2 = Color(0xFF0077B6);
  static const c3 = Color(0xFF0096C7);
  static const c4 = Color(0xFF00B4D8);
  static const c5 = Color(0xFF48CAE4);
  static const c6 = Color(0xFF90E0EF);
  static const c7 = Color(0xFFADE8F4);
  static const c8 = Color(0xFFCAF0F8);

  static const x0 = Color(0xFF00296B);
  static const x1 = Color(0xFF003F88);
  static const x2 = Color(0xFF00509D);
  static const x3 = Color(0xFFFDC500);
  static const x4 = Color(0xFFFFD500);
}

class AppThemeData {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        const TCColors(
          buttonText: AllColors.x0,
          buttonBorder: AllColors.x2,
          frame: AllColors.x1,
          iconButton: AllColors.x0,
        ),
      ],
      scaffoldBackgroundColor: AllColors.white,
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        const TCColors(
          buttonText: AllColors.x3,
          buttonBorder: AllColors.x1,
          frame: AllColors.x4,
          iconButton: AllColors.x2,
        ),
      ],
      scaffoldBackgroundColor: AllColors.black,
    );
  }
}
