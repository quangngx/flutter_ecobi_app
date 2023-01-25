import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/constants/dimension_constants.dart';
import 'package:flutter_ecobi_app/src/core/data/cart.dart';
import 'package:provider/provider.dart';

import '../core/helper/helper.dart';
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
              itemBuilder: (context, index) => ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cart.items.values.toList()[index].title,
                        style: TextStyles.defaultStyle.setTextSize(22),
                      ),
                      Text(
                        'x ${cart.items.values.toList()[index].quantity}',
                        style: TextStyles.defaultStyle.setTextSize(22),
                      )
                    ],
                  ),
                  subtitle: Text(
                    '\$${cart.items.values.toList()[index].price}',
                    style: TextStyles.defaultStyle.setTextSize(16),
                  ),
                  onTap: () {/* react to the tile being tapped */}),
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
                    '\$${cart.totalAmount}',
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
