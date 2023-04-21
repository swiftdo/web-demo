import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../constants.dart';

class LeftSideItem {
  final IconData icon;
  final String title;
  final String path;

  LeftSideItem({required this.icon, required this.title, required this.path});
}

class LeftSidebarProvider extends ChangeNotifier {
  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  final List<LeftSideItem> items = [
    LeftSideItem(icon: LineIcons.newspaperAlt, title: "文章", path: "/"),
    LeftSideItem(icon: LineIcons.hashtag, title: "分类", path: "/articleCates"),
    LeftSideItem(
      icon: LineIcons.question,
      title: "面试题",
      path: "/categoryArticles/${Constants.categoryIdOfReview}?title=面试题",
    ),
    LeftSideItem(
      icon: LineIcons.book,
      title: "开源书籍",
      path: '/categoryArticles/${Constants.categoryIdOfEbook}?title=开源书籍',
    )
  ];

  set selectIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }
}