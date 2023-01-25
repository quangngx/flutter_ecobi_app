import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/constants/dimension_constants.dart';
import 'package:flutter_ecobi_app/src/core/data/cart.dart';
import 'package:provider/provider.dart';

import '../core/helper/helper.dart';
import '../widgets/cart_item.dart' as item;
import '../widgets/primary_button.dart';

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
              itemBuilder: (context, index) => item.CartItem(
                cart: cart,
                id: cart.items.values.toList()[index].id,
                title: cart.items.values.toList()[index].title,
                quantity: cart.items.values.toList()[index].quantity,
                price: cart.items.values.toList()[index].price,
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
