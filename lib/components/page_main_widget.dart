import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/provider/view_state.dart';
import '../core/util/ui_util.dart';
import '../models/models.dart';
import '../pages/article_list_viewmodel.dart';
import '../style/style.dart';
import 'article_cell.dart';
import 'content_widget.dart';
import 'list_load_more.dart';

class PageMainWidget extends StatelessWidget {
  final bool showRightBorder;
  final Widget child;
  const PageMainWidget(
      {Key? key, this.showRightBorder = true, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black12, width: 1),
          right: BorderSide(
              color: showRightBorder ? Colors.black12 : Colors.transparent,
              width: 1),
        ),
      ),
      child: child,
    );
  }
}
