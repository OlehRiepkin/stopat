part of observable;

typedef ObserverBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

class Observer<T> extends StatefulWidget {
  const Observer(
    this.value, {
    required this.builder,
    super.key,
  });

  final Observable<T> value;

  final ObserverBuilder<T> builder;

  @override
  State<StatefulWidget> createState() => _ObserverState<T>();
}

class _ObserverState<T> extends State<Observer<T>> {
  late T value;

  @override
  void initState() {
    super.initState();
    value = widget.value.value;
    widget.value.addListener(_valueChanged);
  }

  @override
  void didUpdateWidget(Observer<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      oldWidget.value.removeListener(_valueChanged);
      value = widget.value.value;
      widget.value.addListener(_valueChanged);
    }
  }

  @override
  void dispose() {
    widget.value.removeListener(_valueChanged);
    super.dispose();
  }

  void _valueChanged() {
    setState(() {
      value = widget.value.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, value);
  }
}
