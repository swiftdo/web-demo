import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:web_demo/pages/about_page.dart';
import 'package:web_demo/pages/article_detail_page.dart';
import 'package:web_demo/pages/category_articles_page.dart';
import 'package:web_demo/pages/home_page.dart';
import 'package:web_demo/pages/index_page.dart';
import 'package:web_demo/pages/unknown_page.dart';

class Router {
  final RoutemasterParser parser = RoutemasterParser();

  final RoutemasterDelegate routemaster = RoutemasterDelegate(
    transitionDelegate: NoAnimationTransitionDelegate(),
    routesBuilder: (context) => RouteMap(
      routes: {
        '/': (_) => MaterialPage(child: IndexPage()),
        '/about': (_) => MaterialPage(child: AboutPage()),
        '/detail/:id': (info) => MaterialPage(
            child: ArticleDetailPage(articleId: info.pathParameters['id']!)),
        '/categoryArticles/:id': (info) => MaterialPage(
              child: CategoryArticlesPage(
                categoryId: info.pathParameters['id']!,
                params: info.queryParameters,
              ),
            ),
      },
      onUnknownRoute: (path) {
        return MaterialPage(child: UnknownPage(path));
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

class NoAnimationTransitionDelegate extends TransitionDelegate<void> {
  @override
  Iterable<RouteTransitionRecord> resolve({
    required List<RouteTransitionRecord> newPageRouteHistory,
    required Map<RouteTransitionRecord?, RouteTransitionRecord>
        locationToExitingPageRoute,
    Map<RouteTransitionRecord?, List<RouteTransitionRecord>>?
        pageRouteToPagelessRoutes,
  }) {
    final results = <RouteTransitionRecord>[];

    for (final pageRoute in newPageRouteHistory) {
      if (pageRoute.isWaitingForEnteringDecision) {
        pageRoute.markForAdd();
      }
      results.add(pageRoute);
    }

    for (final exitingPageRoute in locationToExitingPageRoute.values) {
      if (exitingPageRoute.isWaitingForExitingDecision) {
        exitingPageRoute.markForRemove();
        final pagelessRoutes = pageRouteToPagelessRoutes![exitingPageRoute];
        if (pagelessRoutes != null) {
          for (final pagelessRoute in pagelessRoutes) {
            pagelessRoute.markForRemove();
          }
        }
      }
      results.add(exitingPageRoute);
    }
    return results;
  }
}
