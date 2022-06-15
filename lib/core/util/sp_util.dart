import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  SharedPreferences? _prefs;

  static Future<SpUtil> getInstance() async {
    var singleton = SpUtil();
    await singleton._init();
    return singleton;
  }

  Future _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// put object.
  Future<bool>? putObject(String key, Object value) {
    return _prefs?.setString(key, json.encode(value));
  }

  /// get obj.
  T? getObj<T>(String key, T f(Map v), {T? defValue}) {
    Map? map = getObject(key);
    return map == null ? defValue : f(map);
  }

  /// get object.
  Map? getObject(String key) {
    String? _data = _prefs?.getString(key);
    return (_data == null || _data.isEmpty) ? null : json.decode(_data);
  }

  /// put object list.
  Future<bool>? putObjectList(String key, List<Object> list) {
    List<String>? _dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    return _prefs?.setStringList(key, _dataList);
  }

  /// get obj list.
  List<T>? getObjList<T>(String key, T f(Map v),
      {List<T>? defValue = const []}) {
    List<Map>? dataList = getObjectList(key);
    List<T>? list = dataList?.map((value) {
      return f(value);
    }).toList();
    return list ?? defValue;
  }

  /// get object list.
  List<Map>? getObjectList(String key) {
    List<String>? dataLis = _prefs?.getStringList(key);
    return dataLis?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    }).toList();
  }

  /// get string.
  String? getString(String key, {String? defValue = ''}) {
    return _prefs?.getString(key) ?? defValue;
  }

  /// put string.
  Future<bool>? putString(String key, String value) {
    return _prefs?.setString(key, value);
  }

  /// get bool.
  bool? getBool(String key, {bool? defValue = false}) {
    return _prefs?.getBool(key) ?? defValue;
  }

  /// put bool.
  Future<bool>? putBool(String key, bool value) {
    return _prefs?.setBool(key, value);
  }

  /// get int.
  int? getInt(String key, {int? defValue = 0}) {
    return _prefs?.getInt(key) ?? defValue;
  }

  /// put int.
  Future<bool>? putInt(String key, int value) {
    return _prefs?.setInt(key, value);
  }

  /// get double.
  double? getDouble(String key, {double? defValue = 0.0}) {
    return _prefs?.getDouble(key) ?? defValue;
  }

  /// put double.
  Future<bool>? putDouble(String key, double value) {
    return _prefs?.setDouble(key, value);
  }

  /// get string list.
  List<String>? getStringList(String key, {List<String>? defValue = const []}) {
    return _prefs?.getStringList(key) ?? defValue;
  }

  /// put string list.
  Future<bool>? putStringList(String key, List<String> value) {
    return _prefs?.setStringList(key, value);
  }

  /// get dynamic.
  dynamic getDynamic(String key, {Object? defValue}) {
    return _prefs?.get(key) ?? defValue;
  }

  /// have key.
  bool? haveKey(String key) {
    return _prefs?.getKeys().contains(key);
  }

  /// contains Key.
  bool? containsKey(String key) {
    return _prefs?.containsKey(key);
  }

  /// get keys.
  Set<String>? getKeys() {
    return _prefs?.getKeys();
  }

  /// remove.
  Future<bool>? remove(String key) {
    return _prefs?.remove(key);
  }

  /// clear.
  Future<bool>? clear() {
    return _prefs?.clear();
  }

  /// Fetches the latest values from the host platform.
  Future<void>? reload() {
    return _prefs?.reload();
  }

  ///Sp is initialized.
  bool isInitialized() {
    return _prefs != null;
  }

  /// get Sp.
  SharedPreferences? getSp() {
    return _prefs;
  }
}
