import 'package:flutter/material.dart';

import '../core/config/config.dart';
import '../core/constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, this.onTap, required this.data})
      : super(key: key);
  final Function()? onTap;
  final String data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: kMediumPadding),
        padding: const EdgeInsets.symmetric(vertical: kMediumPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: LightTheme.primaryColor2,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Text(
          data,
          style:
              TextStyles.defaultStyle.whiteTextColor.semibold.setTextSize(16),
        ),
      ),
    );
  }
}
