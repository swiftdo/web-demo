import 'package:flutter/material.dart';
import 'app_router_delegate.dart';
import 'parser.dart';
import 'app_route.dart';

class RouterImpl {
  final LocationParser parser;
  final HomeRoute Function() homeRouteBuilder;

  final RouteInformationParser<Object> routeInformationParser;
  final RouterDelegate<Object> routerDelegate;

  RouterImpl({
    @required this.parser,
    @required this.homeRouteBuilder,
  })  : routeInformationParser = AppRouteInformationParser(parser),
        routerDelegate = AppRouterDelegate(
            router: AppRouter(parser: parser, homeRoute: homeRouteBuilder()));

  static AppRouter of(BuildContext context) => AppRouter.of(context);
}
