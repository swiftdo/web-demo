import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_demo/components/nav_content.dart';
import 'package:web_demo/style/context_style.dart';

class UIUtil {
  static AppBar appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: getValueForScreenType<double>(
        context: context,
        mobile: 44,
        tablet: 44,
        desktop: 72,
      ),
      automaticallyImplyLeading: false,
      title: NavContent(),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  static Widget loading(BuildContext context) {
    return SpinKitWave(
      color: context.primaryColor,
      type: SpinKitWaveType.start,
    );
  }
}
