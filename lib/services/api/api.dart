import '../../models/article.dart';
import '../../models/category.dart';
import '../../models/models.dart';
import 'package:web_demo/constants.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

abstract class Api {
  /// 获取文章列表
  /// [categoryId] 是文章分类id
  Future<List<ArticleModel>> fetchArticleList({
    required int pageNo,
    int pageSize = 20,
    String? categoryId,
  });

  /// 搜索文章
  Future<List<ArticleModel>> searchArticleList({
    required int pageNo,
    int pageSize = 20,
    String? searchKey,
  });

  /// 获取全部文章分类
  Future<List<Category>> fetchArticleCates();

  /// 获取文章详情
  Future<ArticleModel> fetchArticleDetail({
    required String articleId,
  });

  /// 获取分类详情
  Future<Category> fetchCategory(String categoryId);

  /// 获取账号
  Future<User> getAccount();

  /// 登录账号
  Future<Session> login({required String email, required String password});

  /// 登出
  Future logout({required String sessionId});
}

class ApiImpl implements Api {
  late final Client client;
  late final Databases databases;
  late final Account account;

  ApiImpl() {
    client = Client()
        .setEndpoint(Constants.appwriteEndpoint)
        .setProject(Constants.appwriteProject)
        .setSelfSigned(status: true);
    databases = Databases(client);
    account = Account(client);
  }

  @override
  Future<List<Category>> fetchArticleCates() async {
    final res = await databases.listDocuments(
        databaseId: Constants.databaseOfBlog,
        collectionId: Constants.collectionOfCategory);
    return res.documents.map((e) => Category.fromJson(e.data)).toList();
  }

  @override
  Future<ArticleModel> fetchArticleDetail({required String articleId}) async {
    final articleRes = await databases.getDocument(
        databaseId: Constants.databaseOfBlog,
        collectionId: Constants.collectionOfArticle,
        documentId: articleId);
    final article = Article.fromJson(articleRes.data);
    final category = await fetchCategory(article.categoryId);
    return ArticleModel(article: article, category: category);
  }

  @override
  Future<Category> fetchCategory(String categoryId) async {
    final cateRes = await databases.getDocument(
        databaseId: Constants.databaseOfBlog,
        collectionId: Constants.collectionOfCategory,
        documentId: categoryId);
    return Category.fromJson(cateRes.data);
  }

  @override
  Future<List<ArticleModel>> fetchArticleList(
      {required int pageNo, int pageSize = 20, String? categoryId}) async {
    List<String> queries = [
      Query.offset((pageNo - 1) * pageSize),
      Query.limit(pageSize),
      if (categoryId?.isNotEmpty == true) Query.equal("categoryId", categoryId),
      Query.orderDesc("publishDate"),
    ];
    return _queryArticles(queries);
  }

  @override
  Future<List<ArticleModel>> searchArticleList(
      {required int pageNo, int pageSize = 20, String? searchKey}) async {
    List<String> queries = [
      Query.offset((pageNo - 1) * pageSize),
      Query.limit(pageSize),
      if (searchKey?.isNotEmpty == true) Query.search("content", searchKey!),
      Query.orderDesc("publishDate"),
    ];
    return _queryArticles(queries);
  }

  Future<List<ArticleModel>> _queryArticles(List<String> queries) async {
    final articlesRes = await databases.listDocuments(
        databaseId: Constants.databaseOfBlog,
        collectionId: Constants.collectionOfArticle,
        queries: queries);
    List<ArticleModel> result = [];
    for (final doc in articlesRes.documents) {
      final article = Article.fromJson(doc.data);
      final category = await fetchCategory(article.categoryId);
      result.add(ArticleModel(article: article, category: category));
    }
    return result;
  }

  @override
  Future<User> getAccount() {
    return account.get();
  }

  @override
  Future<Session> login({required String email, required String password}) {
    return account.createEmailSession(email: email, password: password);
  }

  @override
  Future logout({required String sessionId}) {
    return account.deleteSession(sessionId: sessionId);
  }
}
