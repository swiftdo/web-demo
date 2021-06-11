import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:web_demo/pages/about_page.dart';
import 'package:web_demo/pages/article_detail_page.dart';
import 'package:web_demo/pages/category_articles_page.dart';
import 'package:web_demo/pages/home_page.dart';

class Router {
  final RoutemasterDelegate routemaster = RoutemasterDelegate(
    routesBuilder: (context) => RouteMap(
      routes: {
        '/': (_) => MaterialPage(child: HomePage()),
        '/about': (_) => MaterialPage(child: AboutPage()),
        '/detail/:id': (info) => MaterialPage(
              child: ArticleDetailPage(
                articleId: info.pathParameters['id']!,
              ),
            ),
        '/categoryArticles/:id': (info) => MaterialPage(
              child: CategoryArticlesPage(
                categoryId: info.pathParameters['id']!,
                params: info.queryParameters,
              ),
            ),
      },
    ),
  );

  NavigationResult<T> push<T extends Object?>(
    String path, {
    Map<String, String>? queryParameters,
  }) {
    return routemaster.push<T>(path, queryParameters: queryParameters);
  }
}
