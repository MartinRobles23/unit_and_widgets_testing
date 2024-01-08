class ServiceLocator {
  ServiceLocator._();
  static final _intance = ServiceLocator._();

  static ServiceLocator get intance => _intance;

  final _data = <String, dynamic>{};

  String _getKey(Type type, String? tag) {
    return '${type.toString()}${tag ?? ''}}';
  }

  T put<T>(T value, {String? tag}) {
    _data[_getKey(T, tag)] = value;
    return value;
  }

  T find<T>({String? tag}) {
    final key = _getKey(T, tag);
    assert(_data.containsKey(key), '$key not found');
    return _data[key]!;
  }

  clear() {
    _data.clear();
  }
}
