import 'package:flutter/material.dart';
import 'package:web_demo/components/item_section.dart';
import 'package:web_demo/components/nav_content.dart';
import 'package:web_demo/components/site_footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        appBar: AppBar(
          toolbarHeight: 72,
          title: NavContent(),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body:
            _buildBody() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(30),
                      child: Column(
                        children: [ItemSection(), ItemSection(), ItemSection()],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                  )
                ],
              ),
              SiteFooter()
            ],
          ),
        ),
        Positioned(
          child: Container(
            width: 300,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  width: 270,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [Text('扫码')],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 270,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [Text('其他')],
                  ),
                )
              ],
            ),
          ),
          right: 0,
          top: 0,
        )
      ],
    );
  }
}
