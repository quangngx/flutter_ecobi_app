import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/data/cart.dart';
import 'package:flutter_ecobi_app/src/core/data/category.dart';
import 'package:flutter_ecobi_app/src/core/data/product_provider.dart';
import 'package:flutter_ecobi_app/src/core/providers/auth_provider.dart';
import 'package:flutter_ecobi_app/src/views/OnBoarding/on_boarding_page.dart';
import 'package:flutter_ecobi_app/src/views/home_page.dart';
import 'package:provider/provider.dart';

import 'core/helper/helper.dart';

class App extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AuthProvider().signOut(context);
    final GlobalKey<State> key = GlobalKey();
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthProvider()),
        StreamProvider(
          create: (context) => context.read<AuthProvider>().authState,
          initialData: null,
        ),
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
      child: StreamBuilder<User?>(
          stream: AuthProvider().auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Container(
                  color: Colors.white,
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return MaterialApp(
                  key: key,
                  navigatorKey: App.navigatorKey,
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primaryColor: LightTheme.primaryColor2,
                    scaffoldBackgroundColor: LightTheme.white,
                    appBarTheme: AppBarTheme(
                      iconTheme: const IconThemeData(
                        color: Colors.black, //change your color here
                      ),
                      shadowColor: Colors.transparent,
                      backgroundColor: LightTheme.white,
                      titleTextStyle:
                          TextStyles.defaultStyle.medium.setTextSize(22),
                    ),
                  ),
                  home: Builder(builder: (context) {
                    SizeHelper.init(context);
                    return const HomePage();
                  }),
                  routes: authorizedRoutes,
                  onGenerateRoute: generateRoutes,
                );
              }
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primaryColor: LightTheme.primaryColor2,
                    scaffoldBackgroundColor: LightTheme.white,
                    appBarTheme: AppBarTheme(
                        iconTheme: const IconThemeData(
                          color: Colors.black, //change your color here
                        ),
                        shadowColor: Colors.transparent,
                        backgroundColor: LightTheme.white,
                        titleTextStyle:
                            TextStyles.defaultStyle.medium.setTextSize(22))),
                home: Builder(builder: (context) {
                  SizeHelper.init(context);
                  // return const PageList(
                  //   isAuthorized: false,
                  // );
                  return const OnBoardingPage();
                }),
                routes: unauthorizedRoutes,
                onGenerateRoute: generateRoutes,
                key: const ValueKey('UnAuthorized'),
              );
            }
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('App Error'),
                ),
              ),
            );
          }),
    );
  }
}
