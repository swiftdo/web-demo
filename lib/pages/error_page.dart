import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(error),
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text('首页'),
            ),
          ],
        ),
      ),
    );
  }
}
