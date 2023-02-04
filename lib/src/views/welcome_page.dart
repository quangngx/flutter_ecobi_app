import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/constants/dimension_constants.dart';
import 'package:flutter_ecobi_app/src/core/helper/helper.dart';
import 'package:flutter_ecobi_app/src/views/sign_in_page.dart';

import '../widgets/primary_button.dart';

class WelcomePage extends StatelessWidget {
  static String routeName = '/welcome_page';

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageHelper.loadFromAsset(AssetHelper.bgWelcome,
              height: SizeHelper.screenHeight * 3 / 5,
              width: double.infinity,
              fit: BoxFit.fill),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ImageHelper.loadFromAsset(AssetHelper.bgWelcome2,
                  height: SizeHelper.screenHeight * 2.13 / 5,
                  width: double.infinity,
                  fit: BoxFit.fill),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ImageHelper.loadFromAsset(AssetHelper.icoWelcome,
                    width: kBottomBarIconSize * 4),
                const SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Get your groceries\nReady for pickup items',
                  style: TextStyles.defaultStyle.setTextSize(30).semibold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: kMediumPadding * 2,
                ),
                PrimaryButton(
                  data: 'Get Started!',
                  onTap: () {
                    Navigator.pushNamed(context, SignInPage.routeName);
                  },
                ),
                SizedBox(
                  height: SizeHelper.bottomSafeAreaPadding,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
