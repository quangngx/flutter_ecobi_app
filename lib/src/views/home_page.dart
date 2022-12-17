import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/constants/dimension_constants.dart';
import 'package:flutter_ecobi_app/src/core/helper/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
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
                  style: TextStyles.defaultStyle.semibold.setTextSize(20),
                ),
                ImageHelper.loadFromAsset(
                  AssetHelper.icoBag,
                  height: kMediumPadding,
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
              controller: scrollController,
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
              style: TextStyles.defaultStyle.bold.setTextSize(22),
            ),
          ),
          //grid products
        ]),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.img, required this.data, this.onTap})
      : super(key: key);
  final String img;
  final String data;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(left: kMediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: SizedBox(
                  height: kMediumPadding * 3,
                  child: ImageHelper.loadFromAsset(img)),
            ),
            const SizedBox(
              height: kItemPadding,
            ),
            Text(
              data,
              style: TextStyles.defaultStyle,
            )
          ],
        ),
      ),
    );
  }
}
