import 'package:flutter/material.dart';

/// 加载更多
class ListLoadMore extends StatelessWidget {
  final VoidCallback? onPressed;
  const ListLoadMore({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('加载下一页'),
        onPressed: onPressed,
      ),
    );
  }
}
