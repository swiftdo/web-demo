import 'package:dio/dio.dart';
import 'package:web_demo/config/config.dart';
import 'package:web_demo/core/util/value_util.dart';
import 'package:web_demo/locator.dart';

class Api {
  Dio _dio;

  Api() {
    _dio = Dio(
      BaseOptions(baseUrl: locator<Config>().baseUrl, connectTimeout: 20000, receiveTimeout: 20000),
    );
  }

  /// 接口请求
  Future<Map> fetchArticleList({int pageNo, int pageSize = 20, String categoryId}) async {
    final response = await _dio.get('list', queryParameters: {
      'pageNo': pageNo,
      'pageSize': pageSize,
      "category_id": categoryId,
    });
    Map data = response.data;
    return data;
  }

  Future<Map> fetchArticleDetail({String articleId}) async {
    final response = await _dio.get('detail', queryParameters: {
      'article_id': articleId,
    });
    Map data = response.data;
    return ValueUtil.toMap(data['data']);
  }
}
