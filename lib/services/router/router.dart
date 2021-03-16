import 'package:flutter/material.dart';
import 'package:web_demo/pages/article_detail_page.dart';
import 'package:web_demo/pages/category_articles_page.dart';
import 'package:web_demo/pages/unknown_page.dart';
import 'package:router_impl/router_impl.dart';

class LocationParserImpl extends LocationParser {
  final HomeRoute Function() homeRouteBuilder;

  LocationParserImpl({
    @required this.homeRouteBuilder,
  });

  @override
  AppRoute parse(String location) {
    Uri uri = Uri.parse(location);

    /// 首页
    if (uri.pathSegments.isEmpty) {
      return homeRouteBuilder();
    }

    ///
    if (uri.pathSegments.length == 1) {
    } else if (uri.pathSegments.length == 2) {
      String path = uri.pathSegments[0];
      String id = uri.pathSegments[1];

      /// 详情页
      if (path == 'detail') {
        if (id != null) {
          return DetailRoute(articleId: id);
        }
      } else if (path == 'categoryArticles') {
        if (id != null) {
          return CategoryArticlesRoute(
              categoryId: id, data: uri.queryParameters);
        }
      }
    }
    return UnknownRoute();
  }
}

class CategoryArticlesRoute extends AppRoute {
  final String categoryId;

  final Map<String, dynamic> data;

  String get queryString => Uri(queryParameters: data).query;

  const CategoryArticlesRoute({this.categoryId, this.data = const {}});

  @override
  Widget get child => CategoryArticlesPage(
        categoryId: categoryId,
        params: data,
      );

  @override
  String get location => "/categoryArticles/$categoryId?$queryString";
}

class DetailRoute extends AppRoute {
  final String articleId;

  const DetailRoute({this.articleId});
  @override
  Widget get child => ArticleDetailPage(articleId: articleId);

  @override
  String get location => "/detail/$articleId";
}

class UnknownRoute extends AppRoute {
  @override
  Widget get child => UnknownPage();

  @override
  String get location => '/404';
}
