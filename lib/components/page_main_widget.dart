import 'package:flutter/material.dart';
import 'package:web_demo/style/context_style.dart';

class PageMainWidget extends StatelessWidget {
  final bool showRightBorder;
  final Widget child;
  const PageMainWidget(
      {Key? key, this.showRightBorder = true, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: context.borderColor, width: 1),
          right: BorderSide(
              color: showRightBorder ? context.borderColor : Colors.transparent,
              width: 1),
        ),
      ),
      child: child,
    );
  }
}
