import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:web_demo/models/models.dart';
import 'package:web_demo/style/context_style.dart';

class ArticleCell extends StatelessWidget {
  final Article article;

  ArticleCell({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/detail/${article.id}');
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: context.bgColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: context.mainTextColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Text(
                            '#' + article.category.name,
                            style: TextStyle(
                              color: context.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.push(
                              '/categoryArticles/${article.category.id}?title=${article.category.name}',
                            );
                          },
                        ),
                        Text(
                          article.showDate,
                          style: TextStyle(
                            fontSize: 12,
                            color: context.subTextColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 0.5,
              color: context.bgColor,
            )
          ],
        ),
      ),
    );
  }
}
