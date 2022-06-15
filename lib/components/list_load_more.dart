import 'package:flutter/material.dart';
import 'package:web_demo/style/context_style.dart';

/// 加载更多
class ListLoadMore extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool hasMore;
  const ListLoadMore({Key? key, required this.onPressed, required this.hasMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 30),
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasMore
                ? GestureDetector(
                    onTap: onPressed,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: context.primaryColor,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: Text(
                        '点击加载下一页',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Text(
                    "到底了~",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  )
          ],
        ));
  }
}
