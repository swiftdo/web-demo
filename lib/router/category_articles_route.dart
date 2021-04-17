import 'package:flutter/material.dart';
import 'package:router_impl/app_route.dart';
import 'package:web_demo/pages/category_articles_page.dart';

class CategoryArticlesRoute extends AppRoute {
  final String categoryId;

  final Map<String, dynamic> data;

  String get queryString => Uri(queryParameters: data).query;

  const CategoryArticlesRoute({required this.categoryId, this.data = const {}});

  @override
  Widget get child =>
      CategoryArticlesPage(categoryId: categoryId, params: data);

  /// web 上显示的
  @override
  String get location => "/categoryArticles/$categoryId?$queryString";
}
