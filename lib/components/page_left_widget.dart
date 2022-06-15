import 'package:flutter/material.dart';

class PageLeftWidget extends StatelessWidget {
  const PageLeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [Text("文章"), Text("分类")]),
    );
  }
}
