import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_demo/pages/about_page.dart';
import 'package:web_demo/pages/article_detail_page.dart';
import 'package:web_demo/pages/category_articles_page.dart';
import 'package:web_demo/pages/home_page.dart';

class Router {
  RouterDelegate<Object> get routerDelegate => router.routerDelegate;

  RouteInformationParser<Object> get routeInformationParser =>
      router.routeInformationParser;

  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => HomePage(),
      ),
      GoRoute(
        path: '/about',
        builder: (BuildContext context, GoRouterState state) => AboutPage(),
      ),
      GoRoute(
        path: '/detail/:id',
        builder: (BuildContext context, GoRouterState state) =>
            ArticleDetailPage(articleId: state.params['id']!),
      ),
      GoRoute(
        path: '/categoryArticles/:id',
        builder: (BuildContext context, GoRouterState state) =>
            CategoryArticlesPage(
          categoryId: state.params['id']!,
          params: state.queryParams,
        ),
      )
    ],
  );
}
