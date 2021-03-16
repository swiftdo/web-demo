import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'app_route.dart';
import 'transitions.dart';
import 'parser.dart';
import 'package:provider/provider.dart';

Key _homeKey = const Key('root');

class AppRouter extends ChangeNotifier {
  final LocationParser parser;

  final AppHomeRoute homeRoute;

  AppRouter({
    @required this.parser,
    @required this.homeRoute,
    Key homeKey,
  }) {
    if (homeKey != null) {
      _homeKey = homeKey;
    }
    _pages = [
      homeRoute.createPage(key: _homeKey),
    ];
  }

  static AppRouter of(BuildContext context) => Provider.of(context, listen: false);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<Page> get pages => List.unmodifiable(_pages);

  List<Page> _pages = [];

  AppRoute get currentRoute => parser.parse(_pages.last.name);

  void didPop(Page page) {
    _pages.remove(page);
    notifyListeners();
  }

  bool get canBack => pages.length > 1;

  /// TODO: setNewRouteNamed('detail', data: {"a": 1, "b": 2})
  setNewRouteNamed(String uri, {Map<String, dynamic> data = const {}}) {
    // 将uri 和 data 转换为 approute，然后调用 setNewRoutePath
  }

  /// 还需要个 pop 操作

  Future<void> setNewRoutePath(AppRoute configuration) async {
    if (configuration is AppHomeRoute) {
      _pages.removeWhere((element) => element.key != _homeKey);
    } else {
      _pages.add(configuration.createPage());
    }
    notifyListeners();
    return;
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  final AppRouter router;

  AppRouterDelegate({this.router}) {
    router.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppRouter>.value(
      value: router,
      child: Consumer<AppRouter>(
        builder: (context, router, _) => Navigator(
          key: navigatorKey,
          onPopPage: _handleOnPopPage,
          pages: router.pages,
          transitionDelegate: kIsWeb ? NoAnimationTransitionDelegate() : DefaultTransitionDelegate(),
        ),
      ),
    );
  }

  bool _handleOnPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (didPop) {
      router.didPop(route.settings);
    }
    return didPop;
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
}
