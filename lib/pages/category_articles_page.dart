import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/components/article_cell.dart';
import 'package:web_demo/components/cate_list_header.dart';
import 'package:web_demo/components/content_widget.dart';
import 'package:web_demo/core/provider/view_state.dart';
import 'package:web_demo/core/util/ui_util.dart';
import 'package:web_demo/core/util/value_util.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/style/style.dart';

import '../components/list_load_more.dart';
import 'article_list_viewmodel.dart';

///
class CategoryArticlesPage extends StatelessWidget {
  final String categoryId;
  final Map<String, dynamic> params;
  CategoryArticlesPage({required this.categoryId, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      appBar: UIUtil.appBar(context),
      body: ChangeNotifierProvider(
        create: (_) => ArticleListViewModel(categoryId: categoryId),
        builder: (context, child) => Consumer<ArticleListViewModel>(
          builder: (context, model, child) {
            return ContentWidget(
              child: model.viewState == ViewState.busy
                  ? UIUtil.loading()
                  : Column(
                      children: [
                        CateListHeader(
                          title: ValueUtil.toStr(params['title']),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              if (index < model.list.length) {
                                Article article = model.list[index];
                                return ArticleCell(article: article);
                              } else {
                                return ListLoadMore(onPressed: () {
                                  model.loadMore();
                                }, hasMore: model.hasMore,);
                              }
                            },
                            itemCount: model.list.length + 1,
                          ),
                        )
                      ],
                    ),
              sideChild: model.viewState == ViewState.busy ? Container() : null,
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
