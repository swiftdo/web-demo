import 'package:flutter/material.dart';
import '../components/page_left_widget.dart';
import '../components/page_main_widget.dart';
import '../components/page_right_widget.dart';
import '../style/style.dart';

class TemplateTabletPage extends StatelessWidget {
  final Widget child;
  const TemplateTabletPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      body: Row(children: [
        Expanded(
          child: PageLeftWidget(),
          flex: 1,
        ),
        Expanded(
          flex: 5,
          child: PageMainWidget(
            child: child,
          ),
        ),
        Expanded(
          flex: 3,
          child: PageRightWidget(),
        ),
      ]),
    );
    ;
  }
}
