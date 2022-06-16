import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:web_demo/pages/template_page.dart';

import '../components/cate_cell.dart';
import '../components/list_loading_view.dart';
import '../components/page_header.dart';
import '../core/provider/view_state.dart';
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
      return ListLoadingView();
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: model.list.map((e) {
            return CateCell(category: e);
          }).toList(),
        ),
      ),
    );
  }
}
