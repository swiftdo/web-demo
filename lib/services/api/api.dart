import 'package:dio/dio.dart';
import 'package:web_demo/config/config.dart';
import 'package:web_demo/core/util/value_util.dart';
import 'package:web_demo/locator.dart';

abstract class Api {
  /// 获取文章列表
  /// [categoryId] 是文章分类id
  Future<Map> fetchArticleList({
    required int pageNo,
    int pageSize = 20,
    String? categoryId,
  });

  /// 搜索文章
  Future<Map> searchArticleList({
    required int pageNo,
    int pageSize = 20,
    String? searchKey,
  });

  /// 获取全部文章分类
  Future<Map> fetchArticleCates();

  /// 获取文章详情
  Future<Map> fetchArticleDetail({
    required String articleId,
  });
}

class ApiImpl implements Api {
  late Dio _dio;

  ApiImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: locator<Config>().baseUrl,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
      ),
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

  /// 获取全部文章分类
  Future<Map> fetchArticleCates() async {
    // https://d6579fc5-c18b-443b-a2ef-01c2b6be51d5.bspapp.com/http/get_news_categories
    final response = await _dio.get('get_news_categories');
    Map data = response.data;
    return ValueUtil.toMap(data);
  }

  /// 搜索文章
  Future<Map> searchArticleList(
      {required int pageNo, int pageSize = 20, String? searchKey}) async {
    Map<String, dynamic> params = {
      'pageNo': pageNo,
      'pageSize': pageSize,
    };
    if (searchKey != null) {
      params['search_key'] = searchKey;
    }
    final response = await _dio.get('search_article', queryParameters: params);
    return ValueUtil.toMap(response.data);
  }
}
