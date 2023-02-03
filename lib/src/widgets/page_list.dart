import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import 'package:flutter_ecobi_app/src/views/product_detail_page.dart';

import '../core/constants/constants.dart';
import 'primary_button.dart';

class PageList extends StatelessWidget {
  final bool isAuthorized ;
  const PageList({super.key,required this.isAuthorized});

  @override
  Widget build(BuildContext context) {
    List<Widget> authorizedPages = authorizedRoutes.entries
        .map((e) => Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: PrimaryButton(
                data: e.key,
                onTap: () {
                  if (e.key == ProductDetailPage.routeName) {
                  } else {
                    Navigator.of(context).pushNamed(e.key);
                  }
                },
              ),
            ))
        .toList();

    List<Widget> unauthorizedPages = unauthorizedRoutes.entries
        .map((e) => Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: PrimaryButton(
                data: e.key,
                onTap: () {
                  if (e.key == ProductDetailPage.routeName) {
                  } else {
                    Navigator.of(context).pushNamed(e.key);
                  }
                },
              ),
            ))
        .toList();
    return isAuthorized ?  Scaffold(
      appBar: AppBar(
        title: const Text('Pages'),
      ),
      body: Column(children: [
        ...authorizedPages,
      ]),
    ) : Scaffold(
      appBar: AppBar(
        title: const Text('Pages'),
      ),
      body: Column(children: [
        ...unauthorizedPages,
      ]),
    );
  }
}
