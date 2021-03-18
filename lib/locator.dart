import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:web_demo/config/config.dart';
import 'package:web_demo/services/api/api.dart';
import 'package:web_demo/services/platform/platform.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  // 配置项目环境
  if (kDebugMode) {
    locator.registerSingleton<Config>(ConfigDebug());
  } else {
    locator.registerSingleton<Config>(ConfigProduct());
  }
  locator.registerFactory<PlatformRepository>(() => PlatformRepositoryImpl());
  locator.registerLazySingleton<Api>(() => ApiImpl());
}
