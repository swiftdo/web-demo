import 'package:flutter/material.dart';
import 'package:router_impl/router_impl.dart';
import 'package:web_demo/pages/category_articles_page.dart';

import 'category_articles_route.dart';
import 'detail_route.dart';
import 'unkonw_route.dart';

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
          return CategoryArticlesRoute(categoryId: id, data: uri.queryParameters);
        }
      }
    }
    return UnknownRoute();
  }
}
