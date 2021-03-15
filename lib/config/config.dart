abstract class Config {
  /// 请求url
  String baseUrl = "https://d6579fc5-c18b-443b-a2ef-01c2b6be51d5.bspapp.com/http/";
}

/// 开发环境
class ConfigDebug extends Config {
  @override
  String get baseUrl => "http://localhost:4500/http/";
}

/// 预发布环境
class ConfigPreview extends Config {}

/// 生产环境
class ConfigProduct extends Config {}
