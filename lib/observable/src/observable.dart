part of observable;

class Observable<T> extends ChangeNotifier implements ValueListenable<T> {
  Observable(this._value);

  @override
  T get value => _value;
  T _value;
  set value(T newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
    notifyListeners();
  }

  void listen(ValueChanged<T> callback) {
    super.addListener(() {
      callback(value);
    });
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
