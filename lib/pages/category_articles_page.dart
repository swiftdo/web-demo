import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:web_demo/components/article_cell.dart';
import 'package:web_demo/components/content_widget.dart';
import 'package:web_demo/core/provider/view_state.dart';
import 'package:web_demo/core/util/ui_util.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/style/style.dart';

import 'article_list_viewmodel.dart';

///
class CategoryArticlesPage extends StatelessWidget {
  final String categoryId;
  CategoryArticlesPage({this.categoryId});

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
                        Column(
                          children: [
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '#推荐阅读',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Style.primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Style.bgColor,
                              height: 0.5,
                            ),
                          ],
                        ),
                        Expanded(
                            child: SmartRefresher(
                          controller: model.refreshController,
                          enablePullDown: true,
                          enablePullUp: true,
                          header: WaterDropHeader(),
                          onRefresh: () => model.refresh(),
                          onLoading: () => model.loadMore(),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              Article article = model.list[index];
                              return ArticleCell(article: article);
                            },
                            itemCount: model.list.length,
                          ),
                        ))
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
