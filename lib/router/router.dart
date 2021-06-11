import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:web_demo/pages/about_page.dart';
import 'package:web_demo/pages/article_detail_page.dart';
import 'package:web_demo/pages/category_articles_page.dart';
import 'package:web_demo/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

class Router {
  final RoutemasterParser parser = RoutemasterParser();

  final RoutemasterDelegate routemaster = RoutemasterDelegate(
    routesBuilder: (context) => RouteMap(
      routes: {
        '/': (_) => MaterialPage(child: HomePage()),
        '/about': (_) => MaterialPage(child: AboutPage()),
        '/detail/:id': (info) => PageTransition(
            child: ArticleDetailPage(articleId: info.queryParameters['id']!),
            type: PageTransitionType.fade) as Page,
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
