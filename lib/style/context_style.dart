import 'dart:js';

import 'package:flutter/material.dart';
import 'package:web_demo/style/theme_provider.dart';
import 'package:provider/provider.dart';

extension ContextStyle on BuildContext {
  bool get isDarkTheme => this.read<ThemeProvider>().isDark;

  Color get primaryColor => const Color(0xffEF5138);

  Color get mainTextColor =>
      isDarkTheme ? Colors.white : const Color(0xff333333);
  Color get subTextColor =>
      isDarkTheme ? Colors.white : const Color(0xffa8a8a8);

  Color get bgColor => isDarkTheme ? Colors.black : Colors.white;

  Color get borderColor => isDarkTheme ? Colors.black : Colors.black12;

  ThemeData get currentTheme =>
      isDarkTheme ? ThemeData.dark() : ThemeData.light();
}