import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  final String path;
  UnknownPage(this.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Couldn't find page '$path'",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
