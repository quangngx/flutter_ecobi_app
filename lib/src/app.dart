import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/widgets/page_list.dart';

import 'core/helper/helper.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: LightTheme.primaryColor2,
          scaffoldBackgroundColor: LightTheme.white,
          appBarTheme: AppBarTheme(
              shadowColor: Colors.transparent,
              backgroundColor: LightTheme.white,
              titleTextStyle: TextStyles.defaultStyle.medium.setTextSize(22))),
      home: Builder(builder: (context) {
        SizeHelper.init(context);
        return const PageList();
      }),
      routes: routes,
      onGenerateRoute: generateRoutes,
    );
  }
}
