import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/core/config/config.dart';
import '../core/constants/constants.dart';
import 'primary_button.dart';

class PageList extends StatelessWidget {
  const PageList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = routes.entries
        .map((e) => Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding),
              child: PrimaryButton(
                data: e.key,
                onTap: () {
                  Navigator.of(context).pushNamed(e.key);
                },
              ),
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pages'),
      ),
      body: Column(children: [
        ...pages,
      ]),
    );
  }
}
