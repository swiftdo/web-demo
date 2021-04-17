import 'package:flutter/material.dart';
import 'package:router_impl/app_route.dart';
import 'package:web_demo/pages/article_detail_page.dart';

class DetailRoute extends AppRoute {
  final String articleId;

  const DetailRoute({required this.articleId});
  @override
  Widget get child => ArticleDetailPage(articleId: articleId);

  @override
  String get location => "/detail/$articleId";
}
