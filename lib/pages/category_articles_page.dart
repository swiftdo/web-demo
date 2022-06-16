import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/components/article_cell.dart';
import 'package:web_demo/components/page_header.dart';
import 'package:web_demo/core/util/value_util.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/pages/template_page.dart';

import '../components/list_empty_view.dart';
import '../components/list_load_more.dart';
import '../components/list_loading_view.dart';
import '../core/provider/view_state.dart';
import 'article_list_viewmodel.dart';

///
class CategoryArticlesPage extends StatelessWidget {
  final String categoryId;
  final Map<String, dynamic> params;
  CategoryArticlesPage({required this.categoryId, required this.params});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      child: ChangeNotifierProvider(
        create: (_) => ArticleListViewModel(categoryId: categoryId),
        builder: (context, child) => Consumer<ArticleListViewModel>(
          builder: (context, model, child) {
            return Column(
              children: [
                PageHeader(title: ValueUtil.toStr(params['title'])),
                Expanded(
                  child: _buildContent(context, model),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ArticleListViewModel model) {
    if (model.viewState == ViewState.busy) {
      return ListLoadingView();
    }

    if (model.list.isEmpty) {
      return ListEmptyView();
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
