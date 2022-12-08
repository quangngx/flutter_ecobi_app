// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_ecobi_app/src/config/config.dart';
// import 'package:google_fonts/google_fonts.dart';

// class OnBoardingPage extends StatefulWidget {
//   const OnBoardingPage({Key? key}) : super(key: key);
//   static String routeName = '/on_boarding_page';
//   @override
//   State<OnBoardingPage> createState() => _OnBoardingPageState();
// }

// class _OnBoardingPageState extends State<OnBoardingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                   child: PageView.builder(
//                     // physics: const NeverScrollableScrollPhysics(),
//                     itemCount: onBoardingList.length,
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                           Expanded(
//                             flex: 6,
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 24),
//                               child: Image.asset(onBoardingList[index].image),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 4,
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 12),
//                                   child: Text(onBoardingList[index].title,
//                                       textAlign: TextAlign.center,
//                                       style: GoogleFonts.poppins(
//                                           fontSize: 26,
//                                           fontWeight: FontWeight.w600)),
//                                 ),
//                                 Text(onBoardingList[index].description,
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.poppins(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w300)),
//                               ],
//                             ),
//                           ),
//                           // Expanded(
//                           //   flex: 1,
//                           //   child: Text(onBoardingList[index].description,
//                           //       textAlign: TextAlign.center,
//                           //       style: GoogleFonts.poppins(
//                           //           fontSize: 14, fontWeight: FontWeight.w300)),
//                           // ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 24),
//                     height: 56,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: LightTheme.primaryColor1,
//                         borderRadius: BorderRadius.circular(16)),
//                     child: Text('Next',
//                         style: GoogleFonts.poppins(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: LightTheme.white)),
//                   ),
//                 ),
//               ],
//             ),
//             Center(
//               child: DotsIndicator(
//                 position: 0,
//                 dotsCount: onBoardingList.length,
//                 decorator: DotsDecorator(
//                   activeColor: LightTheme.primaryColor1,
//                   size: const Size.square(6 * 1.5),
//                   activeSize: const Size(24 * 1.5, 6 * 1.5),
//                   activeShape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Container(
//   color: Colors.blue,
//   child: DotsIndicator(
//     position: _pageIndex.toDouble(),
//     dotsCount: onBoardingList.length,
//     decorator: DotsDecorator(
//       activeColor: LightTheme.primaryColor1,
//       size: const Size.square(6 * 1.5),
//       activeSize: const Size(24 * 1.5, 6 * 1.5),
//       activeShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(4)),
//     ),
//   ),
// ),

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecobi_app/src/modules/OnBoarding/models/on_boarding_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/config/config.dart';
import 'widgets/item_on_boarding.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});
  static String routeName = '/on_boarding_page';
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: PageView(
                    children: [
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
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: LightTheme.primaryColor1,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text('Next',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: LightTheme.white)),
                  ),
                ),
              ],
            ),
            Center(
              child: DotsIndicator(
                position: 0,
                dotsCount: 3,
                decorator: DotsDecorator(
                  activeColor: LightTheme.primaryColor1,
                  size: const Size.square(6 * 1.5),
                  activeSize: const Size(24 * 1.5, 6 * 1.5),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
