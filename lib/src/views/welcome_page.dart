import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/core/constants/dimension_constants.dart';
import 'package:flutter_ecobi_app/src/core/helper/helper.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static String routeName = '/welcome_page';

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
                  color: LightTheme.primaryColor2,
                  onTap: () {},
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

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.data, this.onTap, this.color})
      : super(key: key);

  final String data;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kMediumPadding),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(kDefaultPadding)),
        child: Text(
          'Get Started!',
          style: color == null
              ? TextStyles.defaultStyle.bold.copyWith(
                  color: LightTheme.primaryColor2,
                )
              : TextStyles.defaultStyle.whiteTextColor.semibold.setTextSize(16),
        ),
      ),
    );
  }
}
