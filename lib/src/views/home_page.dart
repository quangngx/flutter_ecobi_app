import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/constants/dimension_constants.dart';
import 'package:flutter_ecobi_app/src/core/data/category.dart';
import 'package:flutter_ecobi_app/src/core/data/product_provider.dart';
import 'package:flutter_ecobi_app/src/core/helper/helper.dart';
import 'package:flutter_ecobi_app/src/views/my_cart_page.dart';
import 'package:provider/provider.dart';

import '../widgets/category_bar.dart';
import '../widgets/product_item.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home_page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = productsData.items;
    final categoryData = Provider.of<CategoryProvider>(context);
    final categories = categoryData.items;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: SizeHelper.topSafeAreaPadding,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageHelper.loadFromAsset(
                  AssetHelper.icoScan,
                  height: kMediumPadding,
                ),
                Text(
                  'Hi, Quang Nguyen',
                  style: TextStyles.defaultStyle.medium.setTextSize(20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MyCartPage.routeName);
                  },
                  child: ImageHelper.loadFromAsset(
                    AssetHelper.icoBag,
                    height: kMediumPadding,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: kDefaultPadding,
                left: kMediumPadding - 6,
                right: kMediumPadding),
            child: ImageHelper.loadFromAsset(AssetHelper.banner),
          ),
          CategoryBar(categories: categories),
          Padding(
            padding: const EdgeInsets.only(left: kMediumPadding),
            child: Text(
              'Today\'s Special',
              style: TextStyles.defaultStyle.semibold.setTextSize(22),
            ),
          ),
          //grid products
          SizedBox(
              height: 500,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: ((context, index) => ChangeNotifierProvider.value(
                    value: products[index], child: const ProductItem())),
              )) //row with two cols
        ]),
      ),
    );
  }
}