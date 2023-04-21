import 'package:web_demo/core/provider/provider.dart';
import 'package:web_demo/locator.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/services/api/api.dart';

class ArticleDetailViewModel extends ViewStateModel {
  ArticleModel? _article;
  ArticleModel? get article => _article;

  final Api api = locator<Api>();

  ArticleDetailViewModel({required String articleId}) {
    fetchDetail(articleId);
  }

  fetchDetail(String articleId) async {
    setBusy();
    _article = await api.fetchArticleDetail(articleId: articleId);
    setIdle();
  }
}