import 'package:flutter/material.dart';
import 'package:web_demo/locator.dart';

import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() async {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: GetX.router.routemaster,
      routeInformationParser: GetX.router.parser,
    );
  }
}
