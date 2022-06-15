import 'package:flutter/material.dart';

import '../style/style.dart';

class CateListHeader extends StatelessWidget {
  final String title;
  const CateListHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '#$title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Style.primaryColor,
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Style.bgColor,
          height: 0.5,
        ),
      ],
    );
  }
}
