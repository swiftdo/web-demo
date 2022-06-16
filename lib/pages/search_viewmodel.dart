import 'package:flutter/material.dart';

import '../core/provider/view_state_refresh_list_model.dart';
import '../core/util/value_util.dart';
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
  Future<List<Article>> loadData({int pageNum = 1}) async {
    Map res = await api.searchArticleList(
        pageNo: pageNum, pageSize: pageSize, searchKey: _searchKey);
    return ValueUtil.toList(res['data'])
        .map((e) => Article.fromMap(e))
        .toList();
  }
}
