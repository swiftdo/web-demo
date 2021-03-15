import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:web_demo/components/article_cell.dart';
import 'package:web_demo/components/content_widget.dart';
import 'package:web_demo/core/util/ui_util.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/pages/home_viewmodel.dart';
import 'package:web_demo/style/style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      appBar: UIUtil.appBar(context),
      body: ChangeNotifierProvider(
        create: (_) => HomeViewModel(),
        builder: (context, child) => Consumer<HomeViewModel>(
          builder: (context, model, child) {
            return ContentWidget(
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
              ),
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
