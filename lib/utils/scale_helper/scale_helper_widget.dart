part of flutter_scale_helper;

class ScaleHelper extends StatelessWidget {
  const ScaleHelper({
    required this.builder,
    this.designSize = ScaleHelperInherited.defaultSize,
    super.key,
  });

  final WidgetBuilder builder;

  /// The [Size] of the device in the design draft, in dp
  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return ScaleHelperInherited(
          constraints: constraints,
          designSize: designSize,
          child: builder(context),
        );
      },
    );
  }
}
