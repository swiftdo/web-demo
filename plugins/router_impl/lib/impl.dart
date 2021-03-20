import 'package:flutter/material.dart';
import 'package:router_impl/back_dispatcher.dart';
import 'app_router_delegate.dart';
import 'parser.dart';
import 'app_route.dart';

class RouterImpl {
  RouteInformationParser<Object> get routeInformationParser =>
      _routeInformationParser;
  RouteInformationParser<Object> _routeInformationParser;
  RouterDelegate<Object> get routerDelegate => _routerDelegate;
  RouterDelegate<Object> _routerDelegate;
  RootBackButtonDispatcher _backButtonDispatcher;
  RootBackButtonDispatcher get backButtonDispatcher => _backButtonDispatcher;

  RouterImpl({LocationParser parser, AppHomeRoute homeRoute}) {
    _routeInformationParser = AppRouteInformationParser(parser);
    final router = AppRouter(parser: parser, homeRoute: homeRoute);
    _routerDelegate = AppRouterDelegate(router: router);
    _backButtonDispatcher = BackDispatcher(router: router);
  }
}
