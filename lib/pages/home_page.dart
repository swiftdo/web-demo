import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/components/page_header.dart';
import 'package:web_demo/pages/template_page.dart';

import '../components/article_cell.dart';
import '../components/list_load_more.dart';
import '../core/provider/view_state.dart';
import '../core/util/ui_util.dart';
import '../models/models.dart';
import 'article_list_viewmodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplatePage(
        child: ChangeNotifierProvider(
      create: (_) => ArticleListViewModel(),
      builder: (context, child) => Consumer<ArticleListViewModel>(
        builder: (context, model, child) {
          return Column(
            children: [
              PageHeader(title: "文章", canBack: false),
              Expanded(child: _buildContent(context, model))
            ],
          );
        },
      ),
    ));
  }

  _buildContent(BuildContext context, ArticleListViewModel model) {
    if (model.viewState == ViewState.busy) {
      return UIUtil.loading(context);
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < model.list.length) {
          Article article = model.list[index];
          return ArticleCell(article: article);
        } else {
          return ListLoadMore(
            onPressed: () {
              model.loadMore();
            },
            hasMore: model.hasMore,
          );
        }
      },
      itemCount: model.list.length + 1,
    );
  }
}
