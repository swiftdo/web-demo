import 'package:web_demo/core/provider/provider.dart';
import 'package:web_demo/core/util/value_util.dart';
import 'package:web_demo/locator.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/services/api/api.dart';

class HomeViewModel extends ViewStateRefreshListModel {
  final Api api = locator<Api>();

  HomeViewModel() {
    initData();
  }

  @override
  Future<List<Article>> loadData({int pageNum}) async {
    Map res = await api.fetchArticleList(pageNo: pageNum, pageSize: pageSize);
    return ValueUtil.toList(res['data'])
        .map((e) => Article.fromMap(e))
        .toList();
  }
}
