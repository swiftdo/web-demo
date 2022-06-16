import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/locator.dart';
import 'package:web_demo/pages/search_viewmodel.dart';
import 'package:web_demo/providers/left_sidebar_provider.dart';
import 'package:web_demo/style/context_style.dart';
import 'package:web_demo/style/theme_provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LeftSidebarProvider()),
        ChangeNotifierProvider(create: (context) => SearchViewModel()),
      ],
      builder: (context, child) => Consumer<ThemeProvider>(
        builder: (context, model, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: GetX.router.routerDelegate,
            routeInformationParser: GetX.router.routeInformationParser,
            theme: context.currentTheme,
          );
        },
      ),
    );
  }
}
