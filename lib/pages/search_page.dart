import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/core/provider/provider.dart';
import 'package:web_demo/pages/search_viewmodel.dart';
import 'package:web_demo/pages/template_page.dart';

import '../components/article_cell.dart';
import '../components/list_load_more.dart';
import '../components/list_loading_view.dart';
import '../components/page_header.dart';
import '../models/models.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      child: Consumer<SearchViewModel>(
        builder: (context, model, child) {
          return Column(
            children: [
              PageHeader(title: "搜索：${model.searchKey ?? ''}", canBack: false),
              Expanded(child: _buildContent(context, model))
            ],
          );
        },
      ),
    );
  }

  _buildContent(BuildContext context, SearchViewModel model) {
    if (model.viewState == ViewState.busy) {
      return ListLoadingView();
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
