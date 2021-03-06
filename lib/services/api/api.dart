import 'package:dio/dio.dart';
import 'package:web_demo/config/config.dart';
import 'package:web_demo/locator.dart';

class Api {
  Dio _dio;

  Api() {
    _dio = Dio(
      BaseOptions(
          baseUrl: locator<Config>().baseUrl,
          connectTimeout: 20000,
          receiveTimeout: 20000),
    );
  }

  /// 接口请求
  Future<Map> fetchArticleList({int pageNo, int pageSize = 20}) async {
    final response = await _dio
        .get('list', queryParameters: {'pageNo': pageNo, 'pageSize': pageSize});
    Map data = response.data;
    print(data);
    return data;
  }
}
