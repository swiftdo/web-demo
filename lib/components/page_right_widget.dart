import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_demo/style/context_style.dart';

import 'side_widget.dart';

class PageRightWidget extends StatelessWidget {
  const PageRightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.headerPadding),
      padding: EdgeInsets.only(left: context.headerPadding),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SideSearchView(), SideWidget(), SideSourceWidget()],
        ),
      ),
    );
  }
}

class SideSourceWidget extends StatelessWidget {
  const SideSourceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        launch("https://github.com/swiftdo/web-demo");
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: context.borderColor,
            ),
            borderRadius: BorderRadius.circular(4)),
        child: Row(children: [
          LineIcon.github(
            size: 20,
          ),
          SizedBox(width: 2),
          Text(
            'swiftdo/web-demo',
            style: TextStyle(fontSize: 14, color: Colors.blue),
          )
        ]),
      ),
    );
  }
}

class SideSearchView extends StatelessWidget {
  const SideSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: context.borderColor),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: LineIcon.search(
            color: Colors.grey,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          hintText: "搜一搜",
          isDense: true,
        ),
      ),
    );
  }
}
