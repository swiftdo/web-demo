import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/pages/about_page.dart';
import 'package:web_demo/pages/article_detail_page.dart';
import 'package:web_demo/pages/category_articles_page.dart';
import 'package:web_demo/pages/dashboard/article_list_page.dart';
import 'package:web_demo/pages/dashboard/category_list_page.dart';
import 'package:web_demo/pages/dashboard/article_create_page.dart';
import 'package:web_demo/pages/dashboard_page.dart';
import 'package:web_demo/pages/home_page.dart';
import 'package:web_demo/pages/search_page.dart';
import 'package:web_demo/providers/auth_provider.dart';

import '../pages/categories_page.dart';
import '../pages/error_page.dart';
import '../pages/login_page.dart';

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

FutureOr<String?> _loginRedirect(BuildContext context, GoRouterState state) {
  if (context.read<AuthProvider>().isLogin) {
    return null;
  } else {
    return '/login';
  }
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
          child: ArticleDetailPage(articleId: state.pathParameters['id']!),
        ),
      ),
      GoRoute(
        path: '/categoryArticles/:id',
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: CategoryArticlesPage(
            categoryId: state.pathParameters['id']!,
            params: state.queryParameters,
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
      GoRoute(
        path: '/search',
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: SearchPage(),
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: '/dashboard',
        redirect: _loginRedirect,
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: DashboardPage(),
        ),
      ),
      GoRoute(
        path: '/article/create',
        redirect: _loginRedirect,
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: ArticleCreatePage(),
        ),
      ),
      GoRoute(
        path: '/article/edit/:id',
        redirect: _loginRedirect,
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: ArticleCreatePage(
            id: state.pathParameters['id'],
          ),
        ),
      ),
      GoRoute(
        path: '/article/list',
        redirect: _loginRedirect,
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: ArticleListPage(),
        ),
      ),
      GoRoute(
        path: '/category/list',
        redirect: _loginRedirect,
        pageBuilder: (BuildContext context, GoRouterState state) => _WebPage(
          key: state.pageKey,
          child: CategoryListPage(),
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
