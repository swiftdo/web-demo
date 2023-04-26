import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/locator.dart';
import 'package:web_demo/providers/auth_provider.dart';

import '../../models/category.dart';
import '../categories_viewmodel.dart';

class CreateArticlePage extends StatefulWidget {
  const CreateArticlePage({Key? key}) : super(key: key);

  @override
  State<CreateArticlePage> createState() => _CreateArticlePageState();
}

class _CreateArticlePageState extends State<CreateArticlePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController coverController = TextEditingController();

  String? categoryId;

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    contentController.dispose();
    coverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('创建文章'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 20),
        children: [
          // 标题
          TextField(
            decoration: InputDecoration(hintText: '文章标题'),
            controller: titleController,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: ChangeNotifierProvider(
              create: (ctx) => CategoriesViewModel(),
              builder: (context, child) => Consumer<CategoriesViewModel>(
                builder: (context, CategoriesViewModel model, child) {
                  if (model.list.isEmpty) {
                    return Container();
                  }
                  return DropdownButton<String>(
                    elevation: 8,
                    style: TextStyle(fontSize: 16),
                    icon: Icon(Icons.arrow_right),
                    value: categoryId,
                    iconSize: 40,
                    iconEnabledColor: Colors.grey,
                    hint: Text('请选择分类'),
                    isExpanded: true,
                    underline: Container(),
                    items: model.list
                        .map(
                          (e) => DropdownMenuItem(
                            child: Row(
                              children: [
                                Text((e as Category).name),
                              ],
                            ),
                            value: e.id,
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        categoryId = value;
                      });
                    },
                  );
                },
              ),
            ),
          ),
          // 分类
          // 封面url
          TextField(
            decoration: InputDecoration(hintText: '文章封面url'),
            controller: coverController,
          ),
          // 简介
          TextField(
            decoration: InputDecoration(hintText: '文章简介'),
            controller: descController,
          ),
          SizedBox(
            height: 20,
          ),
          // 内容，md5
          TextField(
            decoration:
                InputDecoration(hintText: '文章内容', border: OutlineInputBorder()),
            maxLines: 20,
            controller: contentController,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: onSubmit, child: Text('提交')),
        ],
      ),
    );
  }

  onSubmit() {
    final userId = context.read<AuthProvider>().account?.$id;
    if (userId == null) {
      EasyLoading.showError("未登录");
      return;
    }

    if (titleController.text.isEmpty) {
      EasyLoading.showError("请填写标题");
      return;
    }
    if (descController.text.isEmpty) {
      EasyLoading.showError("请填写文字简介");
      return;
    }
    if (contentController.text.isEmpty) {
      EasyLoading.showError("请填写文章内容");
      return;
    }
    if (categoryId == null) {
      EasyLoading.showError("请选择文章分类");
      return;
    }
    try {
      EasyLoading.show();
      // 进行创建文章
      GetX.api.createArticle(
          userId: userId,
          title: titleController.text,
          categoryId: categoryId!,
          content: contentController.text,
          desc: descController.text,
          cover: coverController.text);
      EasyLoading.showSuccess("创建成功");
      titleController.clear();
      contentController.clear();
      descController.clear();
      coverController.clear();
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
