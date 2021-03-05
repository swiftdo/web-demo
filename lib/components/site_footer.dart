import 'package:flutter/material.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      color: Colors.white,
      padding: EdgeInsets.only(top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                Text(
                  '导航',
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('首页'),
                Text('工具库'),
                Text('首页'),
                Text('工具库'),
              ],
            ),
          ),
          Container(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                Text(
                  '小伙伴们',
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('首页'),
                Text('工具库'),
                Text('首页'),
                Text('工具库'),
              ],
            ),
          ),
          Container(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                Text(
                  '关于我',
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Designed & Developed by:'),
                Text('Oldbirds'),
                Text('Copyright © 2021 Oldbirds'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
