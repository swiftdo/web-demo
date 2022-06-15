import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/provider/view_state.dart';
import '../core/util/ui_util.dart';
import '../models/models.dart';
import '../pages/article_list_viewmodel.dart';
import '../style/style.dart';
import 'article_cell.dart';
import 'content_widget.dart';
import 'list_load_more.dart';

class PageMainWidget extends StatelessWidget {
  const PageMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.grey, width: 1),
          right: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: ChangeNotifierProvider(
        create: (_) => ArticleListViewModel(),
        builder: (context, child) => Consumer<ArticleListViewModel>(
          builder: (context, model, child) {
            if (model.viewState == ViewState.busy) {
              return UIUtil.loading();
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
          },
        ),
      ),
    );
  }
}
