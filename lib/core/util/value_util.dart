class ValueUtil {
  static bool isEmptyString(String str) {
    return str == null || str.isEmpty;
  }

  static bool isEmptyList(List list) {
    return list == null || list.isEmpty;
  }

  static bool isEmptyMap(Map map) {
    return map == null || map.isEmpty;
  }

  static bool isEmpty(Object object) {
    if (object == null) return true;
    if (object is String && object.isEmpty) {
      return true;
    } else if (object is List && object.isEmpty) {
      return true;
    } else if (object is Map && object.isEmpty) {
      return true;
    }
    return false;
  }

  static bool isNotEmpty(Object object) {
    return !isEmpty(object);
  }

  static Map toMap(Object value, {Map def = const {}}) {
    if (value is Map) {
      return value;
    } else {
      return def;
    }
  }

  static List toList(Object value, {List def = const []}) {
    if (value is List) {
      return value;
    } else {
      return def;
    }
  }

  static String toStr(Object value, {String def = ''}) {
    if (value is String) {
      return value;
    } else if (value is num) {
      return value.toString();
    } else {
      return def;
    }
  }

  static int toInt(Object value, {int def = 0}) {
    if (value is num) {
      return value.toInt();
    } else if (value is String) {
      return int.tryParse(value);
    } else {
      return def;
    }
  }

  static double toDouble(Object value, {double def = 0}) {
    if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value);
    } else {
      return def;
    }
  }
}
