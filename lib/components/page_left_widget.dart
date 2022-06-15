import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../style/style.dart';

class PageLeftWidget extends StatelessWidget {
  const PageLeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(right: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/');
              },
              child: Text(
                'OldBirds',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Style.primaryColor,
                ),
              ),
            ),
            Container(
              width: 100,
              height: 30,
              child: Row(children: [
                Icon(Icons.home),
                Text(
                  "文章",
                  style: TextStyle(color: Style.primaryColor),
                )
              ]),
              decoration: BoxDecoration(
                color: Style.primaryColor.withOpacity(0.8),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
