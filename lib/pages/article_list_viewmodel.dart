import 'package:web_demo/core/provider/provider.dart';
import 'package:web_demo/core/util/value_util.dart';
import 'package:web_demo/locator.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/services/api/api.dart';

class ArticleListViewModel extends ViewStateRefreshListModel {
  final Api api = locator<Api>();

  final String? categoryId;

  ArticleListViewModel({this.categoryId}) {
    initData();
  }

  @override
  Future<List<Article>> loadData({int pageNum = 1}) async {
    Map res = await api.fetchArticleList(
        pageNo: pageNum, pageSize: pageSize, categoryId: categoryId);
    return ValueUtil.toList(res['data'])
        .map((e) => Article.fromMap(e))
        .toList();
  }
}
