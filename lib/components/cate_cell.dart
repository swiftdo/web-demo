import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/style/context_style.dart';

class CateCell extends StatelessWidget {
  final Category category;
  const CateCell({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.push(
          '/categoryArticles/${category.id}?title=${category.name}',
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: context.borderColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '#' + category.name,
          style: TextStyle(color: context.primaryColor),
        ),
      ),
    );
  }
}
