import 'view_state_list_model.dart';

abstract class ViewStateRefreshListModel<T> extends ViewStateListModel<T> {
  /// 分页第一页页码
  static const int pageNumFirst = 1;

  /// 分页条目数量
  int pageSize = 20;

  /// 当前页码
  int _currentPageNum = pageNumFirst;

  bool hasMore = false;

  /// 下拉刷新
  Future<List<T>?> refresh({bool init = false}) async {
    try {
      _currentPageNum = pageNumFirst;
      var data = await loadData(pageNum: pageNumFirst);
      hasMore = pageSize == data.length;
      if (data.isEmpty) {
        list.clear();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
      }
      setIdle();
      return data;
    } catch (e, s) {
      /// 页面已经加载了数据,如果刷新报错,不应该直接跳转错误页面
      /// 而是显示之前的页面数据.给出错误提示
      if (init) list.clear();
      setError(e.toString());
      return null;
    }
  }

  /// 上拉加载更多
  Future<List<T>?> loadMore() async {
    try {
      var data = await loadData(pageNum: ++_currentPageNum);
      hasMore = pageSize == data.length;
      if (data.isEmpty) {
        _currentPageNum -= 1;
      } else {
        onCompleted(data);
        list.addAll(data);
        notifyListeners();
      }
      return data;
    } catch (e, _) {
      _currentPageNum -= 1;
      return null;
    }
  }

  // 加载数据
  Future<List<T>> loadData({int pageNum = 1});

  removeItem(T item) {
    list.remove(item);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
