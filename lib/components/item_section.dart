import 'package:flutter/material.dart';

class ItemSection extends StatelessWidget {
  const ItemSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "最新",
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children:
                [1, 2, 3, 4, 6, 7, 8, 9, 5].map((e) => ItemCard()).toList(),
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 300 - 30 * 2 - 2 * 20) / 3;
    return Container(
      width: width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.green,
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2D 生成 3D 物件的小公举',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    '快速将 2D 图像转化为 3D 物件',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
