import 'package:flutter/material.dart';
import 'package:web_demo/style/context_style.dart';

import 'side_widget.dart';

class PageRightWidget extends StatelessWidget {
  const PageRightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.headerPadding),
      padding: EdgeInsets.only(left: context.headerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [SideWidget()],
          )
        ],
      ),
    );
  }
}
