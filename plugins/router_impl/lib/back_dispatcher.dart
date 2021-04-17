import 'package:flutter/cupertino.dart';
import 'package:router_impl/app_router_delegate.dart';

class BackDispatcher extends RootBackButtonDispatcher {
  final AppRouter router;

  BackDispatcher({required this.router});

  @override
  Future<bool> didPopRoute() {
    return router.pop();
  }
}
