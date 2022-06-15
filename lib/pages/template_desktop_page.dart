import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/style/context_style.dart';
import 'package:web_demo/style/theme_provider.dart';

import '../components/page_left_widget.dart';
import '../components/page_main_widget.dart';
import '../components/page_right_widget.dart';

class TemplateDesktopPage extends StatelessWidget {
  final Widget child;
  const TemplateDesktopPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.bgColor,
      body: Row(children: [
        Spacer(
          flex: 1,
        ),
        Expanded(
          child: PageLeftWidget(),
          flex: 5,
        ),
        Expanded(
          flex: 10,
          child: PageMainWidget(
            child: child,
          ),
        ),
        Expanded(
          flex: 6,
          child: PageRightWidget(),
        ),
      ]),
    );
  }
}
