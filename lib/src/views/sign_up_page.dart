import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/helper/helper.dart';
import 'package:provider/provider.dart';

import '../core/config/config.dart';
import '../core/constants/constants.dart';
import '../core/providers/auth_provider.dart';
import '../widgets/primary_button.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = '/sign_up_page';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider auth = Provider.of<AuthProvider>(context);
    final TextEditingController displayName = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: ImageHelper.loadFromAsset(AssetHelper.icoWelcome,
                    height: 128)),
            Center(
              child: Text(
                'Welcome',
                style: TextStyles.defaultStyle.bold.setTextSize(26),
              ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              padding: const EdgeInsets.symmetric(
                  vertical: kMinPadding, horizontal: kMediumPadding),
              decoration: BoxDecoration(
                  color: LightTheme.neutral100Color,
                  borderRadius: kDefaultBorderRadius,
                  border: Border.all(color: LightTheme.neutral200Color)),
              child: TextField(
                controller: displayName,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your name',
                    hintStyle: TextStyles.defaultStyle.subTitleTextColor),
              ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              padding: const EdgeInsets.symmetric(
                  vertical: kMinPadding, horizontal: kMediumPadding),
              decoration: BoxDecoration(
                  color: LightTheme.neutral100Color,
                  borderRadius: kDefaultBorderRadius,
                  border: Border.all(color: LightTheme.neutral200Color)),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email',
                    hintStyle: TextStyles.defaultStyle.subTitleTextColor),
              ),
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              padding: const EdgeInsets.symmetric(
                  vertical: kMinPadding, horizontal: kMediumPadding),
              decoration: BoxDecoration(
                  color: LightTheme.neutral100Color,
                  borderRadius: kDefaultBorderRadius,
                  border: Border.all(color: LightTheme.neutral200Color)),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your password',
                    hintStyle: TextStyles.defaultStyle.subTitleTextColor),
              ),
            ),
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            PrimaryButton(
              data: 'Continue',
              onTap: () {
                auth.signUpWithEmail(
                    email: email.text,
                    password: password.text,
                    context: context);
              },
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ',
                    style: TextStyles.defaultStyle.subTitleTextColor),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpPage.routeName);
                  },
                  child: Text(
                    'Log In',
                    style: TextStyles.defaultStyle.semibold
                        .setColor(LightTheme.primaryColor2),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
