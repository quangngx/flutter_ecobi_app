import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/views/OnBoarding/on_boarding_page.dart';
import 'package:flutter_ecobi_app/src/views/home_page.dart';
import 'package:flutter_ecobi_app/src/views/my_cart_page.dart';
import 'package:flutter_ecobi_app/src/views/product_detail_page.dart';
import 'package:flutter_ecobi_app/src/views/sign_in_page.dart';
import 'package:flutter_ecobi_app/src/views/sign_up_page.dart';
import 'package:flutter_ecobi_app/src/views/welcome_page.dart';
import 'package:flutter_ecobi_app/src/views/widgets_page.dart';

final Map<String, WidgetBuilder> authorizedRoutes = {
  WidgetsPage.routeName: (context) => const WidgetsPage(),
  HomePage.routeName: (context) => const HomePage(),
  ProductDetailPage.routeName: (context) => const ProductDetailPage(),
  MyCartPage.routeName: (context) => const MyCartPage(),
  '/error_page': (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Coming soon'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      ),
};

final Map<String, WidgetBuilder> unauthorizedRoutes = {
  WidgetsPage.routeName: (context) => const WidgetsPage(),
  OnBoardingPage.routeName: (context) => const OnBoardingPage(),
  WelcomePage.routeName: (context) => const WelcomePage(),
  SignInPage.routeName: (context) => const SignInPage(),
  SignUpPage.routeName: (context) => const SignUpPage(),
  '/error_page': (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Coming soon'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      ),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    default:
      return null;
  }
}
