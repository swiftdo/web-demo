import 'package:flutter/material.dart';

import 'side_widget.dart';

class PageRightWidget extends StatelessWidget {
  const PageRightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10),
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
