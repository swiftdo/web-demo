import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/style/context_style.dart';

import '../providers/left_sidebar_provider.dart';

class PageLeftWidget extends StatelessWidget {
  const PageLeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(right: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/');
              },
              child: LayoutBuilder(builder: (context, constraints) {
                final itemWith = constraints.maxWidth - 20;
                bool showIcon = itemWith < 150 + 10;
                if (showIcon) {
                  return Container(
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: 150,
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        'OldBirds',
                        style: TextStyle(
                          fontSize: 28,
                          color: context.primaryColor,
                        ),
                      ),
                    ]),
                  );
                }
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<LeftSidebarProvider>(builder: (context, model, child) {
              return Column(
                children: model.items.map((e) {
                  int index = model.items.indexOf(e);
                  return PageLeftItem(
                    title: e.title,
                    icon: e.icon,
                    isSelect: index == model.selectIndex,
                    onTap: () {
                      model.selectIndex = index;
                      context.push(e.path);
                    },
                  );
                }).toList(),
              );
            })
          ],
        )
      ]),
    );
  }
}

class PageLeftItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelect;
  final VoidCallback? onTap;

  const PageLeftItem({
    Key? key,
    required this.title,
    required this.icon,
    this.isSelect = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final itemWith = constraints.maxWidth - 20;
      bool showIcon = itemWith < 150 + 10;

      if (showIcon) {
        return GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isSelect
                  ? context.primaryColor.withOpacity(0.1)
                  : Colors.transparent,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 10),
            child: Icon(
              icon,
              color: isSelect ? context.primaryColor : context.mainTextColor,
            ),
          ),
        );
      } else {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Container(
            width: 150,
            height: 40,
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(bottom: 5),
            child: Row(children: [
              Icon(
                icon,
                color: isSelect ? context.primaryColor : context.mainTextColor,
              ),
              SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                    color: isSelect
                        ? context.primaryColor
                        : context.mainTextColor),
              )
            ]),
            decoration: BoxDecoration(
              color: isSelect
                  ? context.primaryColor.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
      }
    });
  }
}
