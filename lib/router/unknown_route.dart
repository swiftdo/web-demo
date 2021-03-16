import 'package:flutter/material.dart';
import 'package:router_impl/app_route.dart';
import 'package:web_demo/pages/unknown_page.dart';

class UnknownRoute extends AppRoute {
  @override
  Widget get child => UnknownPage();

  @override
  String get location => '/404';
}
