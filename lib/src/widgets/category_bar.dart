import 'package:flutter/material.dart';

import '../core/constants/constants.dart';
import '../core/data/category.dart';
import 'category_item.dart';

class CategoryBar extends StatelessWidget {
  final List<Category> categories;

  const CategoryBar({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMediumPadding * 1.5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories
              .map(
                (e) => CategoryItem(
                  data: e.title,
                  img: e.imgUrl,
                  onTap: () {},
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
