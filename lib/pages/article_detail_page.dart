import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/components/content_widget.dart';
import 'package:web_demo/core/util/ui_util.dart';
import 'package:web_demo/pages/article_detail_viewmodel.dart';
import 'package:web_demo/style/style.dart';

/// 文章详情页
class ArticleDetailPage extends StatelessWidget {
  final String articleId;
  ArticleDetailPage({this.articleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      appBar: UIUtil.appBar(context),
      body: ChangeNotifierProvider(
        create: (_) => ArticleDetailViewModel(articleId: articleId),
        builder: (context, child) => Consumer<ArticleDetailViewModel>(
          builder: (context, model, child) {
            return ContentWidget(child: Container());
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
