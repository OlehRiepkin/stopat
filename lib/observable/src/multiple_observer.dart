part of observable;

class MultipleObserver extends StatefulWidget {
  const MultipleObserver({
    required this.values,
    required this.builder,
    super.key,
  });

  final List<Observable> values;

  final WidgetBuilder builder;

  @override
  State<StatefulWidget> createState() => _MultipleObserverState();
}

class _MultipleObserverState extends State<MultipleObserver> {
  late List values;

  @override
  void initState() {
    super.initState();
    values = widget.values;
    for (final element in widget.values) {
      element.addListener(_valueChanged);
    }
  }

  @override
  void didUpdateWidget(MultipleObserver oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.values != widget.values) {
      for (final element in oldWidget.values) {
        element.removeListener(_valueChanged);
      }
      values = widget.values;
      for (final element in widget.values) {
        element.addListener(_valueChanged);
      }
    }
  }

  @override
  void dispose() {
    for (final element in widget.values) {
      element.removeListener(_valueChanged);
    }
    super.dispose();
  }

  void _valueChanged() {
    setState(() {
      values = widget.values;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
