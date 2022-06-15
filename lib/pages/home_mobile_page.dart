import 'package:flutter/material.dart';
import '../components/page_left_widget.dart';
import '../components/page_main_widget.dart';
import '../style/style.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({Key? key}) : super(key: key);

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
          child: PageMainWidget(),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ]),
    );
  }
}
