import '../../../core/helper/helper.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image: AssetHelper.slide1,
    title: "Get quality groceries\npicked with care",
    description:
        "Shoppers pick the highest quality items.\nThat’s our 100% quality promise",
  ),
  OnBoardingModel(
    image: AssetHelper.slide2,
    title: "Shop from\nyour favorites stores",
    description:
        "Your favorites are on Instacart along with 300\nmore across North America",
  ),
  OnBoardingModel(
    image: AssetHelper.slide3,
    title: "Shop more deals,\nsave more with us",
    description:
        "Save with exclusive deals, coupons\nand more with no membership required!",
  ),
];

// 88 66 89
