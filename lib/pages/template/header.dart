import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BodyStickyView {
  Size size;
  Widget body;

  BodyStickyView({required this.size, required Widget child})
      : body = Container(
          width: size.width,
          height: size.height,
          child: child,
        );
}

class PersistentHeaderBuilder extends SliverPersistentHeaderDelegate {
  final double max;
  final double min;
  final Widget Function(
      BuildContext context, double offset, bool overlapsContent) builder;

  PersistentHeaderBuilder(
      {this.max = 120, this.min = 80, required this.builder})
      : assert(max >= min);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(context, shrinkOffset, overlapsContent);
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant PersistentHeaderBuilder oldDelegate) =>
      max != oldDelegate.max ||
      min != oldDelegate.min ||
      builder != oldDelegate.builder;
}

class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      toolbarHeight: 120,
      centerTitle: true,
      title: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '小程序搜索',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: 400,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  Text(
                    '文章',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '关于',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Github',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Main2Header extends StatelessWidget {
  final double offset;
  final double maxOff;
  final bool overlapsContent;
  final BodyStickyView? stickyHeader;

  const Main2Header({
    Key? key,
    required this.offset,
    required this.overlapsContent,
    required this.maxOff,
    this.stickyHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double r = min(offset / maxOff, 1);
    print('of: $offset, maxOff: $maxOff, r: $r');
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: r < 0.5 ? Colors.blue.withOpacity(1 - r) : Colors.white,
            ),
          ),
          if (r < 0.5)
            Positioned(
                bottom: 80,
                child: Container(
                  height: maxOff,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '小程序搜索',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 400,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Wrap(
                          runSpacing: 10,
                          spacing: 10,
                          children: [
                            Text(
                              '文章',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '关于',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Github',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.red),
                  child: Row(
                    children: [
                      Text(
                        '小程序',
                      ),
                      Text(
                        '专题',
                      )
                    ],
                  ),
                ),
                if (stickyHeader != null) stickyHeader!.body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
