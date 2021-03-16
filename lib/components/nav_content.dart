import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:router_impl/app_route.dart';
import 'package:router_impl/app_router_delegate.dart';
import 'package:web_demo/pages/home_page.dart';
import 'package:web_demo/style/style.dart';

class NavContent extends StatelessWidget {
  const NavContent({
    Key key,
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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppRouter.of(context).setNewRoutePath(
                            HomeRoute(builder: () {
                              return HomePage();
                            }),
                          );
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
                    ],
                  ),
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
