import 'package:web_demo/core/provider/provider.dart';
import 'package:web_demo/locator.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/services/api/api.dart';

class ArticleDetailViewModel extends ViewStateModel {
  Article _article;
  Article get article => _article;

  final Api api = locator<Api>();

  ArticleDetailViewModel({String articleId}) {
    fetchDetail(articleId);
  }

  fetchDetail(String articleId) async {
    setBusy();
    Map res = await api.fetchArticleDetail(articleId: articleId);
    _article = Article.fromMap(res);
    setIdle();
  }
}
