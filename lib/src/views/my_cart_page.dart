import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/data/cart.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatelessWidget {
  static String routeName = '/my_cart_page';
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
        body: ListView.builder(
      itemCount: cart.itemCount,
      itemBuilder: (ctx, index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(cart.items.values.toList()[index].title),
          Text(cart.items.values.toList()[index].quantity.toString()),
        ],
      ),
    ));
  }
}
