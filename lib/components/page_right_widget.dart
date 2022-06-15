import 'package:flutter/material.dart';

import 'side_widget.dart';

class PageRightWidget extends StatelessWidget {
  const PageRightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [SideWidget()]),
    );
  }
}
