import 'package:flutter/material.dart';

class NavContent extends StatelessWidget {
  const NavContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'OldBirds',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff0045FB),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Wrap(
              spacing: 30,
              children: ["工具库", "购买", "关于"]
                  .map((e) => Text(
                        e,
                        style: TextStyle(
                          color: Color(0xff7E7E7E),
                          fontSize: 14,
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff7E7E7E),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: "搜索",
                ),
                style: TextStyle(fontSize: 14),
              ),
              width: 200,
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                child: Text('推荐一个'),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Color(0xff0045FB)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff0045FB), width: 1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
