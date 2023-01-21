import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/views/OnBoarding/on_boarding_page.dart';
import 'package:flutter_ecobi_app/src/views/home_page.dart';
import 'package:flutter_ecobi_app/src/views/my_cart_page.dart';
import 'package:flutter_ecobi_app/src/views/product_detail_page.dart';
import 'package:flutter_ecobi_app/src/views/welcome_page.dart';
import 'package:flutter_ecobi_app/src/views/widgets_page.dart';

final Map<String, WidgetBuilder> routes = {
  WidgetsPage.routeName: (context) => const WidgetsPage(),
  OnBoardingPage.routeName: (context) => const OnBoardingPage(),
  WelcomePage.routeName: (context) => const WelcomePage(),
  HomePage.routeName: (context) => const HomePage(),
  ProductDetailPage.routeName: (context) => const ProductDetailPage(),
  MyCartPage.routeName: (context) => const MyCartPage()
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    default:
      return null;
  }
}
