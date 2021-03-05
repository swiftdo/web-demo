import 'package:flutter/material.dart';

import 'app_route.dart';

abstract class LocationParser {
  AppRoute parse(String location);
}

class AppRouteInformationParser extends RouteInformationParser<AppRoute> {
  final LocationParser parser;
  const AppRouteInformationParser(this.parser);

  @override
  Future<AppRoute> parseRouteInformation(
          RouteInformation routeInformation) async =>
      parser.parse(routeInformation.location);

  @override
  RouteInformation restoreRouteInformation(AppRoute path) =>
      RouteInformation(location: path.location);
}
