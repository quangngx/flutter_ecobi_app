import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String id;
  String title;
  double price;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
