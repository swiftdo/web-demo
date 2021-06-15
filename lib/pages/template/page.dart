import 'package:flutter/material.dart';
import 'package:web_demo/style/style.dart';
import 'header.dart';
import 'footer.dart';

abstract class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      body: CustomScrollView(
        slivers: [
          buildHeader(context),
          ...buildSlivers(context),
          buildFooter(context)
        ],
      ),
    );
  }

  /// 头部
  Widget buildHeader(BuildContext context) {
    // return MainHeader();
    return _buildHeader(context);
  }

  /// 底部
  Widget buildFooter(BuildContext context) {
    return SliverToBoxAdapter(
      child: MainFooter(),
    );
  }

  /// 内容
  List<Widget> buildSlivers(BuildContext context);

  /// 呢绒悬浮头部
  BodyStickyView? buildBodyStickyHeader(BuildContext context);

  Widget _buildHeader(BuildContext context) {
    BodyStickyView? sw = buildBodyStickyHeader(context);

    double navH = 0;
    double maxH = 200;

    if (sw != null) {
      navH = sw.size.height;
      maxH += navH;
    }

    return SliverPersistentHeader(
      pinned: true,
      delegate: PersistentHeaderBuilder(
        min: navH,
        max: maxH,
        builder: (context, offset, overlapsContent) {
          return Main2Header(
            offset: offset,
            maxOff: (maxH - navH),
            overlapsContent: overlapsContent,
            stickyHeader: sw,
          );
        },
      ),
    );
  }
}
