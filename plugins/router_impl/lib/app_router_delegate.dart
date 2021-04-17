import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_route.dart';
import 'transitions.dart';
import 'parser.dart';
import 'package:provider/provider.dart';

LocalKey _homeKey = UniqueKey();

class AppRouter extends ChangeNotifier {
  final LocationParser parser;

  final AppHomeRoute homeRoute;

  AppRouter({
    required this.parser,
    required this.homeRoute,
    LocalKey? homeKey,
  }) {
    print("AppRouter 初始化");
    if (homeKey != null) {
      _homeKey = homeKey;
    }
    _pages = [
      homeRoute.createPage(key: _homeKey),
    ];
  }

  static AppRouter of(BuildContext context) =>
      Provider.of(context, listen: false);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<Page> get pages => List.unmodifiable(_pages);

  List<Page> _pages = [];

  AppRoute get currentRoute => _pages.last.arguments as AppRoute;

  void didPop(Page page) {
    print('🦌didPop');
    _pages.remove(page);
    _notify();
  }

  Future<bool> pop() {
    print('🦌pop');
    if (_pages.length > 1) {
      didPop(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  void push(AppRoute route) {
    print('🦌push');
    setNewRoutePath(route);
  }

  Future<void> setNewRoutePath(AppRoute configuration) async {
    _pages.add(configuration.createPage());
    _notify();
    return SynchronousFuture<void>(null);
  }

  void _notify() {
    print('⏰通知更新');
    notifyListeners();
  }

  void replace(AppRoute route) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(route);
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  final AppRouter router;

  AppRouterDelegate({required this.router}) {
    print("AppRouterDelegate init");
    router.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    print('AppRouterDelegate:: builder');
    return ChangeNotifierProvider<AppRouter>.value(
      value: router,
      child: Consumer<AppRouter>(
        builder: (context, router, _) => Navigator(
          key: navigatorKey,
          onPopPage: _handleOnPopPage,
          pages: router.pages,
          transitionDelegate: kIsWeb
              ? NoAnimationTransitionDelegate<dynamic>()
              : const DefaultTransitionDelegate<dynamic>(),
        ),
      ),
    );
  }

  bool _handleOnPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (router.pages.isNotEmpty) {
      // TODO: 有问题
      // router.didPop(route);
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    router.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => router.navigatorKey;

  @override
  AppRoute get currentConfiguration => router.currentRoute;

  @override
  Future<void> setNewRoutePath(AppRoute configuration) {
    return router.setNewRoutePath(configuration);
  }

  @override
  Future<void> setInitialRoutePath(AppRoute configuration) {
    return setNewRoutePath(configuration);
  }
}
