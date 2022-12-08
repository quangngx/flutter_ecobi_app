import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/modules/Home/home_page.dart';
import 'package:flutter_ecobi_app/src/modules/OnBoarding/on_boarding_page.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardingPage.routeName: (context) => const OnBoardingPage(),
  HomePage.routeName: (context) => const HomePage()
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    default:
      return null;
  }
}