import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_demo/components/nav_content.dart';

class UIUtil {
  static AppBar appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: getValueForScreenType<double>(
        context: context,
        mobile: 44,
        tablet: 44,
        desktop: 72,
      ),
      title: NavContent(),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
