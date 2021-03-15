import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_demo/components/side_widget.dart';
import 'package:web_demo/style/style.dart';

class ContentWidget extends StatelessWidget {
  final Widget child;
  ContentWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => child,
      desktop: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            margin: EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Expanded(
                  child: child,
                ),
                SideWidget(),
              ],
            ),
            width: Style.bodyWidth,
          )
        ],
      ),
    );
  }
}
