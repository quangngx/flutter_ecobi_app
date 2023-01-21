import 'package:flutter/material.dart';

import '../core/config/config.dart';
import '../core/constants/constants.dart';
import '../core/helper/helper.dart';

class CategoryItem extends StatelessWidget {
  final String img;
  final String data;
  final Function()? onTap;
  const CategoryItem(
      {Key? key, required this.img, required this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(left: kMediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: SizedBox(
                  height: kMediumPadding * 3,
                  child: ImageHelper.loadFromAsset(img)),
            ),
            const SizedBox(
              height: kItemPadding,
            ),
            Text(
              data,
              style: TextStyles.defaultStyle,
            )
          ],
        ),
      ),
    );
  }
}
