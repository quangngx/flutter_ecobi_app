import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/views/product_detail_page.dart';
import 'package:provider/provider.dart';

import '../core/config/config.dart';
import '../core/data/cart.dart';
import '../core/data/product.dart';
import '../core/helper/helper.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  get kMediumPadding => null;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: LightTheme.primaryColor2,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: product.isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined),
              onPressed: () {
                product.toggleFavorite();
              },
            ),
          ),
          trailing: IconButton(
            icon: ImageHelper.loadFromAsset(
              AssetHelper.icoBoldAddSquare,
              height: kMediumPadding,
            ),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
          ),
          title: Text(
            product.title,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailPage.routeName,
                arguments: product.id);
          },
          child: Container(
            color: LightTheme.neutral100Color,
            child: Center(child: Text('${product.title} Image')),
          ),
        ),
      ),
    );
  }
}
