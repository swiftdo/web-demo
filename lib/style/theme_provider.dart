import 'package:flutter/material.dart';
import 'package:web_demo/locator.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false; // 黑色主题
  bool get isDark => _isDark;

  static const isDarkKey = "theme_provider_is_dark";

  ThemeProvider() {
    _isDark = (GetX.spUtil.getBool(isDarkKey, defValue: false) ?? false);
  }

  toggle() {
    _isDark = !_isDark;
    notifyListeners();
    GetX.spUtil.putBool(isDarkKey, _isDark);
  }
}
