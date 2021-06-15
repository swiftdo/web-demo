import 'package:flutter/material.dart';
import 'template/template.dart';

class MiniappClassifyPage extends MainPage {
  @override
  List<Widget> buildSlivers(BuildContext context) {
    return [
      SliverPersistentHeader(
        pinned: true,
        delegate: PersistentHeaderBuilder(
          max: 60,
          min: 60,
          builder: (c, offset, ov) => Row(
            children: [
              Text(
                'a',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      SliverFillRemaining(
        child: Container(
          color: Colors.amber,
        ),
      ),
    ];
  }

  @override
  BodyStickyView? buildBodyStickyHeader(BuildContext context) {
    return null;
  }
}
