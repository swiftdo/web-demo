import 'package:flutter/material.dart';

class ListEmptyView extends StatelessWidget {
  const ListEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(children: [
        Icon(
          Icons.hourglass_empty_sharp,
          size: 40,
          color: Colors.grey,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '暂无数据~',
          style: TextStyle(color: Colors.grey),
        )
      ]),
    );
  }
}
