import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/modules/Home/home_page.dart';
import 'package:flutter_ecobi_app/src/modules/OnBoarding/models/on_boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/config/config.dart';
import '../../core/constants/constants.dart';
import 'widgets/item_on_boarding.dart';
import 'widgets/on_boarding_footer.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});
  static String routeName = '/on_boarding_page';
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  final StreamController<int> _streamController = StreamController<int>();
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  final List<Widget> pages = [
    ItemOnBoarding(
      title: onBoardingList[0].title,
      description: onBoardingList[0].description,
      sourceImage: onBoardingList[0].image,
    ),
    ItemOnBoarding(
      title: onBoardingList[1].title,
      description: onBoardingList[1].description,
      sourceImage: onBoardingList[1].image,
    ),
    ItemOnBoarding(
      title: onBoardingList[2].title,
      description: onBoardingList[2].description,
      sourceImage: onBoardingList[2].image,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: pages,
            ),
            Center(
                child: SmoothPageIndicator(
              controller: _pageController,
              count: pages.length,
              effect: const ExpandingDotsEffect(
                expansionFactor: 4,
                dotWidth: kItemPadding,
                dotHeight: kItemPadding,
                activeDotColor: LightTheme.primaryColor2,
              ),
            )),
            StreamBuilder<int>(
                initialData: 0,
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_pageController.page == 2) {
                            Navigator.pushNamed(context, HomePage.routeName);
                          } else {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: kMediumPadding),
                          height: 56,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: LightTheme.primaryColor2,
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding)),
                          child: Text(
                              snapshot.data != 2 ? 'Next' : 'Let\'s Started',
                              style: TextStyles
                                  .defaultStyle.whiteTextColor.semibold
                                  .setTextSize(16)),
                        ),
                      ),
                      snapshot.data != 2
                          ? const SizedBox(height: kDefaultPadding * 6)
                          : const Footer(),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
