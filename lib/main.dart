import 'package:flutter/material.dart';
import 'package:web_demo/locator.dart';
import 'package:web_demo/pages/home_page.dart';
import 'package:router_impl/router_impl.dart';
import 'package:web_demo/services/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouterImpl impl = RouterImpl(
        parser: LocationParserImpl(homeRouteBuilder: _homeRouteBuilder),
        homeRouteBuilder: _homeRouteBuilder);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: impl.routeInformationParser,
      routerDelegate: impl.routerDelegate,
    );
  }

  HomeRoute _homeRouteBuilder() {
    return HomeRoute(builder: () {
      return HomePage();
    });
  }
}
