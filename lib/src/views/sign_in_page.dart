import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/constants/constants.dart';
import 'package:flutter_ecobi_app/src/core/providers/auth_provider.dart';
import 'package:flutter_ecobi_app/src/views/sign_up_page.dart';
import 'package:flutter_ecobi_app/src/widgets/primary_button.dart';
import 'package:provider/provider.dart';

import '../core/config/config.dart';

class SignInPage extends StatelessWidget {
  static const routeName = '/sign_in_page';

  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider auth = Provider.of<AuthProvider>(context);
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              child: Text(
                'Log in with your Email',
                style: TextStyles.defaultStyle.bold.setTextSize(28),
              ),
            ),
            const SizedBox(
              height: kTopPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              child: Text(
                'Please enter your email to log in Ecobi.',
                style: TextStyles.defaultStyle.setTextSize(14),
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
                auth.loginWithEmail(
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
                Text('Not have any account? ',
                    style: TextStyles.defaultStyle.subTitleTextColor),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpPage.routeName);
                  },
                  child: Text(
                    'Sign Up',
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
