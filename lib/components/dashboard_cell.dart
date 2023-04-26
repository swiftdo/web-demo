import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardItem {
  final String title;
  final String path;

  DashboardItem({required this.title, required this.path});
}

class DashboardCell extends StatelessWidget {
  final DashboardItem item;

  const DashboardCell({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.push(item.path);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset.zero,
                blurRadius: 10,
              ),
            ]),
        margin: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
        padding: EdgeInsets.all(20),
        child: Text(item.title),
      ),
    );
  }
}
