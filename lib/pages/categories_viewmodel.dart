import '../core/provider/view_state_refresh_list_model.dart';
import '../locator.dart';
import '../models/category.dart';
import '../services/api/api.dart';

class CategoriesViewModel extends ViewStateRefreshListModel {
  final Api api = locator<Api>();

  CategoriesViewModel() {
    initData();
  }

  @override
  Future<List<Category>> loadData({int pageNum = 1}) async {
    return await api.fetchArticleCates();
  }
}
