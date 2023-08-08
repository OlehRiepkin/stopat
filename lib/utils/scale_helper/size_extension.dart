part of flutter_scale_helper;

extension SizeExtension on num {
  double w(
    BuildContext context, {
    double minScale = 0.5,
    double maxScale = 1.5,
  }) =>
      ScaleHelperInherited.of(context).scaleWidth(
        this,
        minScale: minScale,
        maxScale: maxScale,
      );

  double h(
    BuildContext context, {
    double minScale = 0.5,
    double maxScale = 1.5,
  }) =>
      ScaleHelperInherited.of(context).scaleHeight(
        this,
        minScale: minScale,
        maxScale: maxScale,
      );
}
