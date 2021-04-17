import 'package:flutter/material.dart';
import 'package:router_impl/back_dispatcher.dart';
import 'app_router_delegate.dart';
import 'parser.dart';
import 'app_route.dart';

class RouterImpl {
  RouteInformationParser<Object> get routeInformationParser =>
      _routeInformationParser;
  late RouteInformationParser<Object> _routeInformationParser;
  RouterDelegate<Object> get routerDelegate => _routerDelegate;
  late RouterDelegate<Object> _routerDelegate;
  late RootBackButtonDispatcher _backButtonDispatcher;
  RootBackButtonDispatcher get backButtonDispatcher => _backButtonDispatcher;

  RouterImpl(
      {required LocationParser parser, required AppHomeRoute homeRoute}) {
    _routeInformationParser = AppRouteInformationParser(parser);
    final router = AppRouter(parser: parser, homeRoute: homeRoute);
    _routerDelegate = AppRouterDelegate(router: router);
    _backButtonDispatcher = BackDispatcher(router: router);
  }
}
