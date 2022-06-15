import 'package:flutter/material.dart';

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
          left: BorderSide(color: Colors.black12, width: 1),
          right: BorderSide(
              color: showRightBorder ? Colors.black12 : Colors.transparent,
              width: 1),
        ),
      ),
      child: child,
    );
  }
}
