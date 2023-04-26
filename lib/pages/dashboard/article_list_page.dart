import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/locator.dart';

import '../../components/article_cell.dart';
import '../../components/list_load_more.dart';
import '../../components/list_loading_view.dart';
import '../../core/provider/view_state.dart';
import '../../models/models.dart';
import '../article_list_viewmodel.dart';

// 文章管理
class ArticleListPage extends StatefulWidget {
  const ArticleListPage({Key? key}) : super(key: key);
  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('文章管理'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ArticleListViewModel(),
        builder: (context, child) => Consumer<ArticleListViewModel>(
          builder: (context, model, child) {
            if (model.viewState == ViewState.busy) {
              return ListLoadingView();
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index < model.list.length) {
                  ArticleModel article = model.list[index];
                  return Row(
                    children: [
                      Expanded(child: ArticleCell(article: article)),
                      Container(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () => onDelete(article, context),
                              child: Text(
                                '删除',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () => onEdit(article, context),
                              child: Text('编辑'),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
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

  onEdit(ArticleModel articleModel, BuildContext context) {
    // 跳转
    context.push('/article/edit/${articleModel.article.id}');
  }

  onDelete(ArticleModel articleModel, BuildContext context) async {
    final isSelect = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          titlePadding: EdgeInsets.all(10),
          //标题文本样式
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 16),
          //中间显示的内容
          content: Text("您确定要删除吗?"),
          //中间显示的内容边距
          //默认 EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0)
          contentPadding: EdgeInsets.all(10),
          //中间显示内容的文本样式
          contentTextStyle: TextStyle(color: Colors.black54, fontSize: 14),
          //底部按钮区域
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton(
              child: Text("确定"),
              onPressed: () {
                //关闭 返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (isSelect == true) {
      // 文章进行删除
      try {
        EasyLoading.show();
        await GetX.api.deleteArticle(articleModel.article.id);
        context.read<ArticleListViewModel>().removeItem(articleModel);
        EasyLoading.showSuccess("删除成功");
      } catch (e) {
        EasyLoading.showError(e.toString());
      }
    }
  }
}
