import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';

class OnBoardingModel {
  bool lastScreen;
  String image;
  String title;
  String subtitle;

  String discription;

  OnBoardingModel(
      {required this.image,
      required this.lastScreen,
      required this.title,
      required this.subtitle,
      required this.discription});
}

List<OnBoardingModel> contents = [
  OnBoardingModel(
    title: Lang.current.lbl_follow,
    subtitle: Lang.current.lbl_live_matches,
    image: AssetConstants.pngOnboardingTwo,
    discription: Lang.current.lbl_onboarding_two_subtitle,
    lastScreen: false,
  ),
  OnBoardingModel(
    title: Lang.current.lbl_share,
    subtitle: Lang.current.lbl_your_opinions,
    image: AssetConstants.pngOnboardingThree,
    discription: Lang.current.lbl_onboarding_three_subtitle,
    lastScreen: true,
  ),
];
