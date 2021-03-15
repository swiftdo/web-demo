import 'package:flutter/material.dart';
import 'package:web_demo/style/style.dart';

class NavContent extends StatelessWidget {
  const NavContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 960,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'OldBirds',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Style.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
