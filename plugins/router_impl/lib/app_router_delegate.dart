import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_route.dart';
import 'transitions.dart';
import 'parser.dart';
import 'package:provider/provider.dart';

class AppRouter extends ChangeNotifier {
  final LocationParser parser;

  final AppHomeRoute homeRoute;

  AppRouter({
    @required this.parser,
    @required this.homeRoute,
    Key homeKey,
  }) {
    _paths = [homeRoute];
  }

  static AppRouter of(BuildContext context) =>
      Provider.of(context, listen: false);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<AppRoute> get paths => List.unmodifiable(_paths);

  List<AppRoute> _paths = [];

  AppRoute get currentRoute => _paths.last;

  void didPop(AppRoute path) {
    print('🦌didPop');
    _paths.remove(path);
    _notify();
  }

  Future<bool> pop() {
    print('🦌pop');
    if (_paths.length > 1) {
      didPop(_paths.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  void push(AppRoute route) {
    print('🦌push');
    setNewRoutePath(route);
  }

  Future<void> setNewRoutePath(AppRoute configuration) async {
    _paths.add(configuration);
    _notify();
    return SynchronousFuture<void>(null);
  }

  void _notify() {
    print('⏰通知更新');
    notifyListeners();
  }

  void replace(AppRoute route) {
    if (_paths.isNotEmpty) {
      _paths.removeLast();
    }
    push(route);
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  final AppRouter router;

  AppRouterDelegate({this.router}) {
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
          pages: router.paths.map((e) => e.createPage()).toList(),
          transitionDelegate: kIsWeb
              ? NoAnimationTransitionDelegate()
              : DefaultTransitionDelegate(),
        ),
      ),
    );
  }

  bool _handleOnPopPage(Route<dynamic> route, dynamic result) {
    print('_handleOnPopPage');
    if (!route.didPop(result)) {
      return false;
    }
    if (router.paths.isNotEmpty) {
      print('_handleOnPopPage a');
      router.didPop(route.settings as AppRoute);
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
