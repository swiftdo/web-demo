import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_demo/pages/about_page.dart';
import 'package:web_demo/pages/article_detail_page.dart';
import 'package:web_demo/pages/category_articles_page.dart';
import 'package:web_demo/pages/home_page.dart';

import '../pages/categories_page.dart';
import '../pages/error_page.dart';

class _WebPage extends CustomTransitionPage {
  _WebPage({
    LocalKey? key,
    required Widget child,
  }) : super(
          child: child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(opacity: animation, child: child);
          },
          key: key,
        );
}

class Router {
  RouterDelegate<Object> get routerDelegate => router.routerDelegate;

  RouteInformationParser<Object> get routeInformationParser =>
      router.routeInformationParser;

  final GoRouter router = GoRouter(
    observers: [MyNavObserver()],
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: HomePage(),
        ),
      ),
      GoRoute(
        path: '/about',
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: AboutPage(),
        ),
      ),
      GoRoute(
        path: '/detail/:id',
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: ArticleDetailPage(articleId: state.params['id']!),
        ),
      ),
      GoRoute(
        path: '/categoryArticles/:id',
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: CategoryArticlesPage(
            categoryId: state.params['id']!,
            params: state.queryParams,
          ),
        ),
      ),
      GoRoute(
        path: '/articleCates',
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: CategoriesPage(),
        ),
      ),
    ],
    errorPageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
      key: state.pageKey,
      child: ErrorPage(error: state.error.toString()),
    ),
  );
}

class MyNavObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    //TODO: 如何告知左侧侧边栏？riverpod ?
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {}

  @override
  void didStopUserGesture() {}
}
