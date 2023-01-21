import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/constants/dimension_constants.dart';
import 'package:flutter_ecobi_app/src/core/data/cart.dart';
import 'package:flutter_ecobi_app/src/core/data/product.dart';
import 'package:flutter_ecobi_app/src/core/data/product_provider.dart';
import 'package:flutter_ecobi_app/src/core/helper/helper.dart';
import 'package:flutter_ecobi_app/src/views/my_cart_page.dart';
import 'package:provider/provider.dart';

import '../widgets/category_item.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home_page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = productsData.items;

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
                  child: Container(
                    color: Colors.red,
                    child: ImageHelper.loadFromAsset(
                      AssetHelper.icoBag,
                      height: kMediumPadding,
                    ),
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
          //scroll bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kMediumPadding * 1.5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryItem(
                    data: 'Meat',
                    img: AssetHelper.icoMeat,
                    onTap: () {},
                  ),
                  CategoryItem(
                    data: 'Fruit',
                    img: AssetHelper.icoFruit,
                    onTap: () {},
                  ),
                  CategoryItem(
                    data: 'Vegetable',
                    img: AssetHelper.icoVegetable,
                    onTap: () {},
                  ),
                  CategoryItem(
                    data: 'Seafood',
                    img: AssetHelper.icoSeafood,
                    onTap: () {},
                  ),
                  CategoryItem(
                    data: 'Bread',
                    img: AssetHelper.icoBread,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
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
                itemBuilder: ((context, index) => ChangeNotifierProvider(
                    create: (context) => products[index],
                    child: const ProductItem())),
              )) //row with two cols
        ]),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

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
              printOut('add to cart');
              printOut('${product.id}, ${product.price}, ${product.title}');
            },
          ),
          title: Text(
            product.title,
          ),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Text(product.title),
              // Consumer<CartProvider>(
              //     builder: ((ctx, cart, _) => Text(
              //         'Cart: ${cart.items.values.toList()[index].quantity}')))
            ],
          ),
        ),
      ),
    );
  }
}
