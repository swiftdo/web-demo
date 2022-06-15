import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final bool canBack;

  const PageHeader({Key? key, required this.title, this.canBack = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100]!))),
      padding: EdgeInsets.only(left: 20),
      height: 60,
      child: Row(children: [
        if (canBack)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.pop();
            },
            child: Container(
              child: Icon(Icons.arrow_back),
              padding: EdgeInsets.only(right: 10),
            ),
          ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ]),
    );
  }
}
