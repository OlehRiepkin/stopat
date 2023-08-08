part of providers;

enum GameDifficulty {
  easy,
  normal,
  hard;

  static List<GameDifficulty> get uiOrdered => [
        GameDifficulty.easy,
        GameDifficulty.normal,
        GameDifficulty.hard,
      ];

  String get displayTitle => switch (this) {
        GameDifficulty.easy => ls(LK.enums_difficulty_easy),
        GameDifficulty.normal => ls(LK.enums_difficulty_normal),
        GameDifficulty.hard => ls(LK.enums_difficulty_hard),
      };

  int get fractionDigits => switch (this) {
        GameDifficulty.easy => 1,
        GameDifficulty.normal => 2,
        GameDifficulty.hard => 3,
      };

  // String format(int valueMilliseconds) =>
  //     (valueMilliseconds / 1000).toStringAsFixed(fractionDigits);

  String format(int valueMilliseconds) {
    final value = valueMilliseconds / 1000;
    String stringValue = value.toString();
    RegExp regex = RegExp(r'^(\d+)(?:\.(\d+))?$');
    final match = regex.firstMatch(stringValue);

    if (match != null) {
      final wholePart = match.group(1);
      String decimalPart = match.group(2) ?? '';

      if (fractionDigits > decimalPart.length) {
        // Add trailing zeros if necessary
        decimalPart = decimalPart.padRight(fractionDigits, '0');
      } else if (fractionDigits > 0) {
        // Truncate decimal part if needed
        decimalPart = decimalPart.substring(0, fractionDigits);
      }

      return '$wholePart${fractionDigits > 0 ? '.' : ''}$decimalPart';
    }

    return value.toString(); // Return original value if regex doesn't match
  }
}
