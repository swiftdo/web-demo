import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_demo/components/page_left_widget.dart';
import 'package:web_demo/components/page_main_widget.dart';
import 'package:web_demo/components/page_right_widget.dart';
import 'package:web_demo/pages/home_desktop_page.dart';
import 'package:web_demo/pages/home_tablet_page.dart';

import 'package:web_demo/style/style.dart';

import 'home_mobile_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => HomeMobilePage(),
      tablet: (BuildContext context) => HomeTabletPage(),
      desktop: (BuildContext context) => HomeDesktopPage(),
      watch: (BuildContext context) => Container(color: Colors.purple),
    );
  }
}
