import 'package:flutter/material.dart';

import 'product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Product 1',
      price: 29.99,
    ),
    Product(
      id: 'p2',
      title: 'Product 2',
      price: 59.99,
    ),
    Product(
      id: 'p3',
      title: 'Product 3',
      price: 19.99,
    ),
    Product(
      id: 'p4',
      title: 'Product 4',
      price: 49.99,
    ),
  ];

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    notifyListeners();
  }

  Product findByID(String id) {
    return _items.firstWhere((e) => e.id == id);
  }
}
