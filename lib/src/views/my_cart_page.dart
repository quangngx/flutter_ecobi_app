import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/constants/dimension_constants.dart';
import 'package:flutter_ecobi_app/src/core/data/cart.dart';
import 'package:provider/provider.dart';

import '../core/helper/helper.dart';
import '../widgets/primary_button.dart';
import 'product_detail_page.dart';

class CartItem extends StatelessWidget {
  final CartProvider cart;

  final int index;
  const CartItem({Key? key, required this.cart, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cart.items.values.toList()[index].title,
              style: TextStyles.defaultStyle.setTextSize(22),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${cart.items.values.toList()[index].price}',
              style: TextStyles.defaultStyle.setTextSize(16),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      cart.decreaseQuantity(
                          cart.items.entries
                              .firstWhere((item) =>
                                  item.key ==
                                  cart.items.values.toList()[index].id)
                              .key,
                          cart.items.values.toList()[index].price,
                          cart.items.values.toList()[index].title);
                      printOut(cart.items.keys.toString());
                    },
                    icon: ImageHelper.loadFromAsset(AssetHelper.icoBoldMinus)),
                Text(
                  '${cart.items.values.toList()[index].quantity}',
                  style: TextStyles.defaultStyle.setTextSize(22),
                ),
                IconButton(
                    onPressed: () {
                      cart.addItem(
                          cart.items.entries
                              .firstWhere((item) =>
                                  item.key ==
                                  cart.items.values.toList()[index].id)
                              .key,
                          cart.items.values.toList()[index].price,
                          cart.items.values.toList()[index].title);
                    },
                    icon: ImageHelper.loadFromAsset(AssetHelper.icoBoldAdd)),
              ],
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, ProductDetailPage.routeName,
              arguments: cart.items.values.toList()[index].id);
        });
  }
}

class MyCartPage extends StatelessWidget {
  static String routeName = '/my_cart_page';
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) => CartItem(
                cart: cart,
                index: index,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kMediumPadding),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyles.defaultStyle.setTextSize(22).setColor(
                          LightTheme.primaryColor1,
                        ),
                  ),
                  Text(
                    '\$${cart.totalAmount.toStringAsFixed(2)}',
                    style: TextStyles.defaultStyle
                        .setTextSize(22)
                        .setColor(LightTheme.primaryColor1),
                  ),
                ],
              ),
            ),
          ),
          PrimaryButton(
            data: 'Check out',
            onTap: () {},
          ),
          SizedBox(
            height: SizeHelper.bottomSafeAreaPadding,
          )
        ],
      ),
    );
  }
}
