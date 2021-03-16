import 'package:flutter/src/widgets/framework.dart';
import 'package:router_impl/app_route.dart';
import 'package:web_demo/pages/about_page.dart';

class AboutRoute extends AppRoute {
  @override
  Widget get child => AboutPage();

  @override
  String get location => "/about";
}
