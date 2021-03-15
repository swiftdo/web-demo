import 'package:flutter/material.dart';
import 'package:web_demo/style/style.dart';

class SideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Style.sideWidth,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Style.sideWidth,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '扫码关注微信公众号OldBirds',
                ),
                Image.asset(
                  'assets/images/wechat_cobe.jpeg',
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            width: Style.sideWidth,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('扫码加入 FlutterOldBirds 微信群'),
                Image.asset(
                  'assets/images/wechat_qun.jpg',
                  fit: BoxFit.fitWidth,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
