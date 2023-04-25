import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:web_demo/models/models.dart';
import 'package:web_demo/style/context_style.dart';

class ArticleCell extends StatelessWidget {
  final ArticleModel article;

  ArticleCell({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/detail/${article.article.id}');
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: context.bgColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.article.title,
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
                  if (article.article.cover?.isNotEmpty == true)
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          article.article.cover!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return Container(
                              height: 80,
                              width: 80,
                              color: Colors.grey[100],
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
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
