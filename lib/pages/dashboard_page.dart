import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/locator.dart';
import 'package:web_demo/providers/auth_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('控制台'),
        actions: [
          GestureDetector(
            onTap: onLogout,
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 10),
              child: Text('退出登录'),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.push('/article/create');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset.zero,
                      blurRadius: 10,
                    ),
                  ]),
              margin: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
              padding: EdgeInsets.all(20),
              child: Text('创建文章'),
            ),
          )
        ],
      ),
    );
  }

  onLogout() async {
    final res = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("确认退出登录?"),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text("确认"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (res == true) {
      EasyLoading.show();
      try {
        await context.read<AuthProvider>().logout();
        EasyLoading.showSuccess("已退出");
        if (context.mounted) {
          context.replace("/");
        }
      } catch (e, s) {
        EasyLoading.showError(e.toString());
      }
    }
  }
}
