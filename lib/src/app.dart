import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/data/cart.dart';
import 'package:flutter_ecobi_app/src/core/data/category.dart';
import 'package:flutter_ecobi_app/src/core/data/product_provider.dart';
import 'package:flutter_ecobi_app/src/widgets/page_list.dart';
import 'package:provider/provider.dart';

import 'core/helper/helper.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: LightTheme.primaryColor2,
            scaffoldBackgroundColor: LightTheme.white,
            appBarTheme: AppBarTheme(
                shadowColor: Colors.transparent,
                backgroundColor: LightTheme.white,
                titleTextStyle:
                    TextStyles.defaultStyle.medium.setTextSize(22))),
        home: Builder(builder: (context) {
          SizeHelper.init(context);
          return const PageList();
        }),
        routes: routes,
        onGenerateRoute: generateRoutes,
      ),
    );
  }
}
