import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_demo/style/style.dart';

class NavContent extends StatelessWidget {
  const NavContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Style.bodyWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: 20,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push('/');
                        },
                        child: Text(
                          'OldBirds',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Style.primaryColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(
                              '/categoryArticles/62a9749d6927690001ca3a9f?title=面试题');
                        },
                        child: Text(
                          'Flutter面试题',
                          style: TextStyle(
                            fontSize: 16,
                            color: Style.mainTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push('/about');
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Text(
                            '关于',
                            style: TextStyle(
                              fontSize: 16,
                              color: Style.mainTextColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
      mobile: (context) {
        return Row(
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
        );
      },
    );
  }
}
