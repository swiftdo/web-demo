import 'package:flutter/material.dart';
import 'package:router_impl/app_router_delegate.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/services/router/router.dart';
import 'package:web_demo/style/style.dart';

class ArticleCell extends StatelessWidget {
  final Article article;

  ArticleCell({@required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.of(context).setNewRoutePath(DetailRoute());
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.white,
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
                      color: Style.mainTextColor,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '#' + article.category.name,
                          style: TextStyle(
                            color: Style.primaryColor,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          article.showDate,
                          style: TextStyle(
                            fontSize: 12,
                            color: Style.subTextColor,
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
              color: Style.bgColor,
            )
          ],
        ),
      ),
    );
  }
}
