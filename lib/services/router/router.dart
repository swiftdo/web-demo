import 'package:flutter/material.dart';
import 'package:web_demo/pages/unknown_page.dart';
import 'package:router_impl/router_impl.dart';

class LocationParserImpl extends LocationParser {
  final HomeRoute Function() homeRouteBuilder;

  LocationParserImpl({
    @required this.homeRouteBuilder,
  });

  @override
  AppRoute parse(String location) {
    Uri uri = Uri.parse(location);

    if (uri.pathSegments.isEmpty) {
      return homeRouteBuilder();
    }

    return UnknownRoute();
  }
}

class UnknownRoute extends AppRoute {
  @override
  Widget get child => UnknownPage();

  @override
  String get location => '/404';
}
