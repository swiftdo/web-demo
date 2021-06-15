import 'package:flutter/material.dart';
import 'template/template.dart';

class IndexPage extends MainPage {
  @override
  List<Widget> buildSlivers(BuildContext context) {
    return [
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (ctx, index) {
            return Container(
              child: Text("aaaa"),
              height: 100,
            );
          },
          childCount: 50,
        ),
      )
    ];
  }

  @override
  BodyStickyView? buildBodyStickyHeader(BuildContext context) {
    return BodyStickyView(
      size: Size(MediaQuery.of(context).size.width, 60),
      child: Container(
        color: Colors.yellow,
      ),
    );
  }
}
