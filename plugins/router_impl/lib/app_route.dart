import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

abstract class AppRoute {
  const AppRoute();

  String get location;
  Widget get child;

  Page<T> createPage<T>({Key key}) {
    return AdaptivePage.create(
      child: child,
      key: key ?? UniqueKey(),
      name: location,
    );
  }
}

typedef AppHomeRouteChildBuilder = Widget Function();

abstract class AppHomeRoute extends AppRoute {
  AppHomeRouteChildBuilder get builder;

  AppHomeRoute();

  @override
  String get location => "/";

  @override
  Widget get child => builder();
}

class AdaptivePage {
  static Page<T> create<T>({
    @required Widget child,
    bool maintainState = true,
    bool fullscreenDialog = false,
    LocalKey key,
    String name,
    Object arguments,
    String title,
  }) {
    assert(child != null);
    assert(maintainState != null);
    assert(fullscreenDialog != null);

    if (kIsWeb) {
      return MaterialPage<T>(
        key: key,
        child: Builder(
          builder: (context) => WillPopScope(
            onWillPop: () async {
              if (Navigator.of(context).userGestureInProgress) {
                return false;
              } else {
                return true;
              }
            },
            child: child,
          ),
        ),
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        name: name,
        arguments: arguments,
      );
    } else if (Platform.isIOS) {
      return CupertinoPage<T>(
        key: key,
        child: child,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        name: name,
        arguments: arguments,
        title: title,
      );
    } else {
      return MaterialPage<T>(
        key: key,
        child: child,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        name: name,
        arguments: arguments,
      );
    }
  }
}
