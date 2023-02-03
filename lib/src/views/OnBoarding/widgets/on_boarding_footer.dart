import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/views/sign_up_page.dart';
import 'package:flutter_ecobi_app/src/views/welcome_page.dart';

import '../../../core/config/config.dart';
import '../../../core/constants/constants.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kDefaultPadding,
        ),
        SizedBox(
          height: kDefaultPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Not looking for groceries?',
                style: TextStyles.defaultStyle.subTitleTextColor,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignUpPage.routeName);
                },
                child: Text(
                  'Become a shopper',
                  style: TextStyles.defaultStyle.semibold
                      .setColor(LightTheme.primaryColor2),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: kDefaultPadding * 4,
        ),
      ],
    );
  }
}
