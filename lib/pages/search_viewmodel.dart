import '../core/provider/view_state_refresh_list_model.dart';
import '../locator.dart';
import '../models/models.dart';
import '../services/api/api.dart';

class SearchViewModel extends ViewStateRefreshListModel {
  final Api api = locator<Api>();

  String? _searchKey;

  String? get searchKey => _searchKey;

  SearchViewModel() {
    initData();
  }

  set searchKey(String? text) {
    _searchKey = text;

    initData();
  }

  @override
  Future<List<ArticleModel>> loadData({int pageNum = 1}) async {
    return await api.searchArticleList(
      pageNo: pageNum,
      pageSize: pageSize,
      searchKey: _searchKey,
    );
  }
}
