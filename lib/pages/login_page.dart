import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:web_demo/locator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('登录'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(hintText: '邮箱'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(hintText: "密码"),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: onSubmit, child: Text('登录')),
        ],
      ),
    );
  }

  onSubmit() async {
    if (_emailController.text.isEmpty) {
      EasyLoading.showError("请输入邮箱");
      return;
    }
    if (_passwordController.text.isEmpty) {
      EasyLoading.showError("请输入密码");
    }

    EasyLoading.show();
    try {
      await GetX.api.login(
          email: _emailController.text, password: _passwordController.text);
      EasyLoading.showSuccess("登录成功");
      if (context.mounted) {
        context.replace("/");
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
