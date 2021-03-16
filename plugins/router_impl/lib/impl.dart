import 'package:flutter/material.dart';
import 'app_router_delegate.dart';
import 'parser.dart';
import 'app_route.dart';

class RouterImpl {
  final LocationParser parser;
  final AppHomeRoute homeRoute;
  final RouteInformationParser<Object> routeInformationParser;
  final RouterDelegate<Object> routerDelegate;

  RouterImpl({
    @required this.parser,
    @required this.homeRoute,
  })  : routeInformationParser = AppRouteInformationParser(parser),
        routerDelegate = AppRouterDelegate(
          router: AppRouter(
            parser: parser,
            homeRoute: homeRoute,
          ),
        );
}
