import '../core/util/date_util.dart';
import 'article.dart';
import 'category.dart';

class ArticleModel {
  final Article article;
  final Category category;

  final String showDetail;

  String get showDate => DateUtil.readTimestamp(article.publishDate);


  ArticleModel({required this.article, required this.category}): showDetail = article.content;
}