import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_demo/pages/template_desktop_page.dart';
import 'package:web_demo/pages/template_tablet_page.dart';

import 'template_mobile_page.dart';

class TemplatePage extends StatelessWidget {
  final Widget child;
  const TemplatePage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => TemplateMobilePage(
        child: child,
      ),
      tablet: (BuildContext context) => TemplateTabletPage(
        child: child,
      ),
      desktop: (BuildContext context) => TemplateDesktopPage(
        child: child,
      ),
    );
  }
}
