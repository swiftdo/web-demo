import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_demo/core/provider/provider.dart';
import 'package:web_demo/core/util/ui_util.dart';
import 'package:web_demo/pages/article_detail_viewmodel.dart';
import 'package:web_demo/pages/template_page.dart';
import 'package:web_demo/style/context_style.dart';

import '../components/page_header.dart';

/// 文章详情页
class ArticleDetailPage extends StatelessWidget {
  final String articleId;

  final TocController tocController = TocController();

  ArticleDetailPage({required this.articleId});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      child: Column(children: [
        PageHeader(title: "文章详情"),
        Expanded(
          child: ChangeNotifierProvider(
            create: (_) => ArticleDetailViewModel(articleId: articleId),
            builder: (context, child) => Consumer<ArticleDetailViewModel>(
              builder: (context, model, child) {
                return _buildDetail(model, context);
              },
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildDetail(ArticleDetailViewModel model, BuildContext context) {
    if (model.viewState == ViewState.busy) {
      return UIUtil.loading(context);
    }
    return Container(
      color: context.bgColor,
      child: MarkdownWidget(
        data: model.article!.showDetail,
        controller: tocController,
        padding: EdgeInsets.only(bottom: 50, left: 16, right: 16, top: 16),
        styleConfig: StyleConfig(
          markdownTheme: context.isDarkTheme
              ? MarkdownTheme.darkTheme
              : MarkdownTheme.lightTheme,
          pConfig: PConfig(
            onLinkTap: (url) {
              if (url != null) {
                launch(url);
              }
            },
          ),
        ),
      ),
    );
  }
}
