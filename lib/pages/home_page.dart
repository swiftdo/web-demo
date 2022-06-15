import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/components/article_cell.dart';
import 'package:web_demo/components/content_widget.dart';
import 'package:web_demo/core/provider/provider.dart';
import 'package:web_demo/core/util/ui_util.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/pages/article_list_viewmodel.dart';
import 'package:web_demo/style/style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      appBar: UIUtil.appBar(context),
      body: ChangeNotifierProvider(
        create: (_) => ArticleListViewModel(),
        builder: (context, child) => Consumer<ArticleListViewModel>(
          builder: (context, model, child) {
            return ContentWidget(
              child: model.viewState == ViewState.busy
                  ? UIUtil.loading()
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        if (index < model.list.length) {
                          Article article = model.list[index];
                          return ArticleCell(article: article);
                        } else {
                          return Container(
                            child: ElevatedButton(
                              child: Text('加载下一页'),
                              onPressed: () {
                                model.loadMore();
                              },
                            ),
                          );
                        }
                      },
                      itemCount: model.list.length + (model.hasMore ? 1 : 0),
                    ),
              sideChild: model.viewState == ViewState.busy ? Container() : null,
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
