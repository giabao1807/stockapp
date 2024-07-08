import 'package:collection/collection.dart';

class EnumHelper {
  static T enumFromString<T>(Iterable<T> values, String value) {
    return values.firstWhereOrNull(
            (type) => type.toString().split('.').last == value) ??
        values.first;
  }

  static V enumOf<K, V>(Map<K, V> map, K value) {
    return map[value] ?? map.values.first;
  }
}
