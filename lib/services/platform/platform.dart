import 'dart:io' as dart;
import 'package:flutter/foundation.dart';

enum Platform {
  android,
  fuchsia,
  ios,
  linux,
  macos,
  web,
  windows,
}

extension PlatformExtension on Platform {
  bool get isAndroid => this == Platform.android;
  bool get isFuchsia => this == Platform.fuchsia;
  bool get isIOS => this == Platform.ios;
  bool get isLinux => this == Platform.linux;
  bool get isMacos => this == Platform.macos;
  bool get isWeb => this == Platform.web;
  bool get isWindows => this == Platform.windows;
}

abstract class PlatformRepository {
  Platform getPlatform();
}

class PlatformRepositoryImpl extends PlatformRepository {
  Platform getPlatform() {
    if (kIsWeb) {
      return Platform.web;
    }
    if (dart.Platform.isAndroid) {
      return Platform.android;
    } else if (dart.Platform.isFuchsia) {
      return Platform.fuchsia;
    } else if (dart.Platform.isIOS) {
      return Platform.ios;
    } else if (dart.Platform.isLinux) {
      return Platform.linux;
    } else if (dart.Platform.isMacOS) {
      return Platform.macos;
    } else if (dart.Platform.isWindows) {
      return Platform.windows;
    } else {
      throw UnimplementedError();
    }
  }
}
