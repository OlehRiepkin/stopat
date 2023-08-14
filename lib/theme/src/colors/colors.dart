part of theme;

@immutable
class TCColors extends ThemeExtension<TCColors> {
  const TCColors({
    required this.buttonText,
    required this.buttonBorder,
    required this.buttonShadow,
    required this.buttonStart,
    required this.buttonStop,
    required this.buttonReset,
    required this.frame,
    required this.iconButton,
  });

  final Color buttonText;
  final Color buttonBorder;
  final Color buttonShadow;
  final Color buttonStart;
  final Color buttonStop;
  final Color buttonReset;
  final Color frame;
  final Color iconButton;

  static TCColors of(BuildContext context) {
    return Theme.of(context).extension<TCColors>()!;
  }

  @override
  ThemeExtension<TCColors> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<TCColors> lerp(
    covariant ThemeExtension<TCColors>? other,
    double t,
  ) {
    if (other is! TCColors) {
      return this;
    }
    return TCColors(
      buttonText: _tryLerp(buttonText, other.buttonText, t),
      buttonBorder: _tryLerp(buttonBorder, other.buttonBorder, t),
      buttonShadow: _tryLerp(buttonShadow, other.buttonShadow, t),
      buttonStart: _tryLerp(buttonStart, other.buttonStart, t),
      buttonStop: _tryLerp(buttonStop, other.buttonStop, t),
      buttonReset: _tryLerp(buttonReset, other.buttonReset, t),
      frame: _tryLerp(frame, other.frame, t),
      iconButton: _tryLerp(iconButton, other.iconButton, t),
    );
  }

  Color _tryLerp(Color? a, Color? b, double t) =>
      Color.lerp(a, b, t) ?? Colors.red;
}
