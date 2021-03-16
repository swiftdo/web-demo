import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_demo/components/content_widget.dart';
import 'package:web_demo/core/provider/provider.dart';
import 'package:web_demo/core/util/ui_util.dart';
import 'package:web_demo/pages/article_detail_viewmodel.dart';
import 'package:web_demo/style/style.dart';

/// 文章详情页
class ArticleDetailPage extends StatelessWidget {
  final String articleId;

  final TocController tocController = TocController();

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
            return ContentWidget(
              child: _buildDetail(model),
              sideChild: _buildToc(model),
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildDetail(ArticleDetailViewModel model) {
    if (model.viewState == ViewState.busy) {
      return UIUtil.loading();
    }
    return Container(
      color: Colors.white,
      child: MarkdownWidget(
        data: model.article.showDetail,
        controller: tocController,
        padding: EdgeInsets.only(bottom: 50, left: 16, right: 16, top: 16),
        styleConfig: StyleConfig(pConfig: PConfig(onLinkTap: (url) {
          launch(url);
        })),
      ),
    );
  }

  Widget _buildToc(ArticleDetailViewModel model) {
    if (model.viewState == ViewState.busy) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: TocListWidget(
        controller: tocController,
        tocItem: (toc, isCurrent) {
          return GestureDetector(
            onTap: () {
              tocController.scrollController.jumpTo(index: toc.index);
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              margin: EdgeInsets.only(left: 10.0 * toc.tagLevel, top: 10),
              child: Text(
                toc.name,
                style: TextStyle(
                  fontSize: isCurrent ? 16 : 14,
                  color: isCurrent ? Colors.blue : null,
                  fontWeight: isCurrent ? FontWeight.bold : null,
                ),
              ),
            ),
          );
        },
      ),
      width: Style.sideWidth,
    );
  }
}
