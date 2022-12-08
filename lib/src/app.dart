import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/modules/OnBoarding/on_boarding_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: LightTheme.primaryColor1,
        scaffoldBackgroundColor: LightTheme.white,
      ),
      home: const OnBoardingPage(),
      onGenerateRoute: generateRoutes,
    );
  }
}
