import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_demo/pages/template_page.dart';
import 'package:web_demo/style/context_style.dart';

import '../components/page_header.dart';
import '../core/provider/view_state.dart';
import '../core/util/ui_util.dart';
import 'categories_viewmodel.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      child: ChangeNotifierProvider(
        create: (ctx) => CategoriesViewModel(),
        builder: (context, child) =>
            Consumer<CategoriesViewModel>(builder: (context, model, child) {
          return Column(
            children: [
              PageHeader(title: "分类", canBack: false),
              Expanded(child: _buildContent(context, model))
            ],
          );
        }),
      ),
    );
  }

  Widget _buildContent(BuildContext context, CategoriesViewModel model) {
    if (model.viewState == ViewState.busy) {
      return UIUtil.loading(context);
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final cate = model.list[index];
        return Container(
          decoration: BoxDecoration(color: context.primaryColor),
          child: Text(cate.name),
        );
      },
      itemCount: model.list.length,
    );
  }
}
