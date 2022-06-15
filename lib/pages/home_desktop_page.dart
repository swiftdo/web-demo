import 'package:flutter/material.dart';

import '../components/page_left_widget.dart';
import '../components/page_main_widget.dart';
import '../components/page_right_widget.dart';
import '../style/style.dart';

class HomeDesktopPage extends StatelessWidget {
  const HomeDesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
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
          child: PageMainWidget(),
        ),
        Expanded(
          flex: 6,
          child: PageRightWidget(),
        ),
      ]),
    );
  }
}
