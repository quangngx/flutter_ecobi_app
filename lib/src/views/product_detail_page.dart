import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/data/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  static String routeName = '/product_detail_page';
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductProvider>(context).findByID(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              loadedProduct.title,
              style: TextStyles.defaultStyle.medium.setTextSize(30),
            ),
          ),
          Text(
            'Price: \$${loadedProduct.price}',
            style: TextStyles.defaultStyle.medium.setTextSize(30),
          ),
          Text(
            'Is Favorite: ${loadedProduct.isFavorite}',
            style: TextStyles.defaultStyle.medium.setTextSize(30),
          ),
        ],
      ),
    );
  }
}
