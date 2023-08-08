part of flutter_scale_helper;

class ScaleHelperInherited extends InheritedWidget {
  const ScaleHelperInherited({
    required super.child,
    required this.constraints,
    this.designSize = defaultSize,
    super.key,
  });

  static const Size defaultSize = Size(375, 667);

  final Size designSize;
  final BoxConstraints constraints;

  double get screenWidth => constraints.maxWidth;
  double get screenHeight => constraints.maxHeight;

  double get ratioWidth => screenWidth / designSize.width;
  double get ratioHeight => screenHeight / designSize.height;

  double scaleWidth(
    num width, {
    required double minScale,
    required double maxScale,
  }) {
    var ratio = ratioWidth;
    if (ratio < minScale) {
      ratio = minScale;
    } else if (ratio > maxScale) {
      ratio = maxScale;
    }
    return width * ratio;
  }

  double scaleHeight(
    num height, {
    required double minScale,
    required double maxScale,
  }) {
    var ratio = ratioHeight;
    if (ratio < minScale) {
      ratio = minScale;
    } else if (ratio > maxScale) {
      ratio = maxScale;
    }
    return height * ratio;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static ScaleHelperInherited of(BuildContext context) {
    ScaleHelperInherited? scaleHelperWidget =
        context.dependOnInheritedWidgetOfExactType<ScaleHelperInherited>();

    if (scaleHelperWidget == null) {
      throw Exception('No ScaleHelperInherited on widgets tree');
    }
    return scaleHelperWidget;
  }
}
