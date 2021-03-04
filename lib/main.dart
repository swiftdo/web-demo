import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        toolbarHeight: 72,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'DesignTools',
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
                    foregroundColor:
                        MaterialStateProperty.all(Color(0xff0045FB)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 14)),
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
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:
          _buildBody(), // This trailing comma makes auto-formatting nicer for build methods.
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
              Container(
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
              )
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
