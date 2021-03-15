import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:web_demo/components/article_cell.dart';
import 'package:web_demo/components/nav_content.dart';
import 'package:web_demo/models/models.dart';
import 'package:web_demo/pages/home_viewmodel.dart';
import 'package:web_demo/style/style.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        toolbarHeight: getValueForScreenType<double>(
          context: context,
          mobile: 44,
          tablet: 44,
          desktop: 72,
        ),
        title: NavContent(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (_) => HomeViewModel(),
        builder: (context, child) => Consumer<HomeViewModel>(
          builder: (context, model, child) {
            return _buildBody(model, context);
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody(HomeViewModel model, BuildContext context) {
    Widget articlesList = SmartRefresher(
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
    );

    return ScreenTypeLayout.builder(
      mobile: (_) => articlesList,
      desktop: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            margin: EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Expanded(
                  child: articlesList,
                ),
                _buildSide()
              ],
            ),
            width: Style.bodyWidth,
          )
        ],
      ),
    );
  }

  Container _buildSide() {
    return Container(
      width: Style.sideWidth,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Style.sideWidth,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '扫码关注微信公众号OldBirds',
                ),
                Image.asset(
                  'assets/images/wechat_cobe.jpeg',
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            width: Style.sideWidth,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('扫码加入 FlutterOldBirds 微信群'),
                Image.asset(
                  'assets/images/wechat_qun.jpg',
                  fit: BoxFit.fitWidth,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
