import 'package:flutter/material.dart';

import '../helper/helper.dart';

class Category {
  String id;
  String title;
  String imgUrl;

  Category({required this.id, required this.title, required this.imgUrl});
}

class CategoryProvider with ChangeNotifier {
  final List<Category> _items = [
    Category(
      id: 'ct1',
      title: 'Meat',
      imgUrl: AssetHelper.icoMeat,
    ),
    Category(
      id: 'ct2',
      title: 'Fruit',
      imgUrl: AssetHelper.icoFruit,
    ),
    Category(
      id: 'ct3',
      title: 'Vegetable',
      imgUrl: AssetHelper.icoVegetable,
    ),
    Category(
      id: 'ct4',
      title: 'Seafood',
      imgUrl: AssetHelper.icoSeafood,
    ),
    Category(
      id: 'ct5',
      title: 'Bread',
      imgUrl: AssetHelper.icoBread,
    ),
  ];

  List<Category> get items {
    return [..._items];
  }
}
