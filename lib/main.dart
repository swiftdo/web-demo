import 'package:flutter/material.dart';
import 'package:web_demo/locator.dart';
import 'package:web_demo/pages/home_page.dart';
import 'package:router_impl/router_impl.dart';
import 'package:web_demo/router/router.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() async {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouterImpl impl = RouterImpl(
        parser: LocationParserImpl(homeRouteBuilder: _homeRouteBuilder), homeRouteBuilder: _homeRouteBuilder);

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
