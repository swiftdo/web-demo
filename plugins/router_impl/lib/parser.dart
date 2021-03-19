import 'package:flutter/material.dart';

import 'app_route.dart';

abstract class LocationParser {
  AppRoute parse(String location);
}

class AppRouteInformationParser extends RouteInformationParser<AppRoute> {
  final LocationParser parser;
  const AppRouteInformationParser(this.parser);

  /// 接受系统传递给我们的路由信息
  @override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) async =>
      parser.parse(routeInformation.location);

  // 表示从传入的 configuration 恢复路由信息
  @override
  RouteInformation restoreRouteInformation(AppRoute path) => RouteInformation(location: path.location);
}
