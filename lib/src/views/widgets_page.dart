import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/constants/dimension_constants.dart';
import 'package:flutter_ecobi_app/src/widgets/primary_button.dart';

class WidgetsPage extends StatelessWidget {
  const WidgetsPage({super.key});
  static String routeName = '/widgets_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pages'),
      ),
      body: Column(
        children: const [
          PrimaryButton(data: 'Button'),
        ],
      ),
    );
  }
}
