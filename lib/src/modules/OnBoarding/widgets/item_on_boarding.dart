import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/helper/helper.dart';

import '../../../core/config/config.dart';
import '../../../core/constants/constants.dart';

class ItemOnBoarding extends StatelessWidget {
  const ItemOnBoarding(
      {Key? key,
      required this.title,
      required this.description,
      required this.sourceImage})
      : super(key: key);

  final String title;
  final String description;
  final String sourceImage;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: kMediumPadding * 3.6,
      ),
      Container(
        alignment: Alignment.center,
        child: ImageHelper.loadFromAsset(sourceImage,
            height: 300, fit: BoxFit.fitHeight),
      ),
      const SizedBox(
        height: kMediumPadding * 4,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyles.defaultStyle.setTextSize(30).semibold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            Text(
              description,
              style: TextStyles.defaultStyle.subTitleTextColor
                  .setTextSize(16)
                  .light,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )
    ]);
  }
}
