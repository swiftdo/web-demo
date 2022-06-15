import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/components/custom_switch.dart';
import 'package:web_demo/style/context_style.dart';

import '../style/theme_provider.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final bool canBack;

  const PageHeader({Key? key, required this.title, this.canBack = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: context.borderColor,
      ))),
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Wrap(
          children: [
            if (canBack)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.pop();
                },
                child: Container(
                  child: Icon(Icons.arrow_back),
                  padding: EdgeInsets.only(right: 10),
                ),
              ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Consumer(builder: (context, ThemeProvider themeModel, child) {
          return CustomSwitch(
            width: 36.0,
            height: 20.0,
            toggleSize: 20.0,
            value: themeModel.isDark,
            borderRadius: 30.0,
            padding: 0.0,
            activeToggleColor: Color(0xFF6E40C9),
            inactiveToggleColor: Color(0xFF2F363D),
            activeSwitchBorder: Border.all(
              color: Color(0xFF3C1E70),
              width: 1.0,
            ),
            inactiveSwitchBorder: Border.all(
              color: context.primaryColor.withOpacity(0.2),
              width: 1.0,
            ),
            activeColor: context.primaryColor,
            inactiveColor: Colors.white,
            activeIcon: Icon(
              Icons.nightlight_round,
              color: Color(0xFFF8E3A1),
            ),
            inactiveIcon: Icon(
              Icons.wb_sunny,
              color: Color(0xFFFFDF5D),
            ),
            onToggle: (val) {
              themeModel.toggle();
            },
          );
        }),
      ]),
    );
  }
}
