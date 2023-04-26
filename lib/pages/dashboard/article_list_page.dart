import 'package:flutter/material.dart';

// 文章管理
class ArticleListPage extends StatefulWidget {
  const ArticleListPage({Key? key}) : super(key: key);
  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('文章管理'),
      ),
    );
  }
}
