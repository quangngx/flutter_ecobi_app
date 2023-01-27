import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/constants/dimension_constants.dart';
import 'package:provider/provider.dart';

import '../core/config/config.dart';
import '../core/data/cart.dart';
import '../core/helper/helper.dart';
import '../views/product_detail_page.dart';

class CartItem extends StatelessWidget {
  final CartProvider cart;
  final String id;
  final String title;
  final int quantity;
  final double price;
  const CartItem(
      {Key? key,
      required this.cart,
      required this.id,
      required this.title,
      required this.quantity,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        alignment: Alignment.centerRight,
        child: Container(
            height: 50,
            width: kMediumPadding * 3,
            decoration: const BoxDecoration(
              color: LightTheme.neutral700Color,
              borderRadius: kDefaultBorderRadius,
            ),
            child: ImageHelper.loadFromAsset(AssetHelper.icoBoldTrash,
                width: kMediumPadding,
                height: kMediumPadding,
                tintColor: LightTheme.white)),
      ),
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).removeItem(id);
      },
      child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.setTextSize(22),
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$price',
                style: TextStyles.defaultStyle.setTextSize(16),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        cart.removeSingleItem(cart.items.entries
                            .firstWhere((item) => item.key == id)
                            .key);
                      },
                      icon:
                          ImageHelper.loadFromAsset(AssetHelper.icoBoldMinus)),
                  Text(
                    '$quantity',
                    style: TextStyles.defaultStyle.setTextSize(22),
                  ),
                  IconButton(
                      onPressed: () {
                        cart.addItem(
                            cart.items.entries
                                .firstWhere((item) => item.key == id)
                                .key,
                            price,
                            title);
                      },
                      icon: ImageHelper.loadFromAsset(AssetHelper.icoBoldAdd)),
                ],
              )
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, ProductDetailPage.routeName,
                arguments: id);
          }),
    );
  }
}
