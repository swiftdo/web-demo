import 'package:dio/dio.dart';
import 'package:web_demo/config/config.dart';
import 'package:web_demo/core/util/value_util.dart';
import 'package:web_demo/locator.dart';

abstract class Api {
  /// 获取文章列表
  /// [categoryId] 是文章分类id
  Future<Map> fetchArticleList(
      {required int pageNo, int pageSize = 20, String? categoryId});

  /// 获取文章详情
  Future<Map> fetchArticleDetail({required String articleId});
}

class ApiImpl implements Api {
  late Dio _dio;

  ApiImpl() {
    _dio = Dio(
      BaseOptions(
          baseUrl: locator<Config>().baseUrl,
          connectTimeout: 20000,
          receiveTimeout: 20000),
    );
  }

  /// 接口请求
  Future<Map> fetchArticleList(
      {required int pageNo, int pageSize = 20, String? categoryId}) async {
    Map<String, dynamic> params = {
      'pageNo': pageNo,
      'pageSize': pageSize,
    };
    if (categoryId != null) {
      params['category_id'] = categoryId;
    }

    final response = await _dio.get('list', queryParameters: params);
    Map data = response.data;
    return data;
  }

  Future<Map> fetchArticleDetail({required String articleId}) async {
    final response = await _dio.get('detail', queryParameters: {
      'article_id': articleId,
    });
    Map data = response.data;
    return ValueUtil.toMap(data['data']);
  }
}
