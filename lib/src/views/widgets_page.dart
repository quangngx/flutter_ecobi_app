import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/widgets/category_bar.dart';
import 'package:flutter_ecobi_app/src/widgets/primary_button.dart';
import 'package:provider/provider.dart';

import '../core/data/category.dart';

class WidgetsPage extends StatelessWidget {
  static String routeName = '/widgets_page';
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryProvider>(context);
    final categories = categoryData.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets'),
      ),
      body: Column(
        children: [
          CategoryBar(categories: categories),
          const PrimaryButton(data: 'Button'),
        ],
      ),
    );
  }
}
