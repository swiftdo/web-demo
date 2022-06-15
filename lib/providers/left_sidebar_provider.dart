import 'package:flutter/material.dart';

class LeftSideItem {
  final IconData icon;
  final String title;

  LeftSideItem({required this.icon, required this.title});
}

class LeftSidebarProvider extends ChangeNotifier {
  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  final List<LeftSideItem> items = [
    LeftSideItem(icon: Icons.home, title: "文章"),
    LeftSideItem(icon: Icons.tag, title: "分类"),
  ];

  set selectIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }
}
