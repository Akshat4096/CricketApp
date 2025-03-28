import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/ui/pages/onboarding/model/onboarding_model.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/app_button.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/ui/widgets/custom/custom_app_bar.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/extensions/extensions.dart';
import 'package:ny_cricket_app/app/utils/helpers/injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  static Widget builder(BuildContext context) {
    return const OnboardingPages();
  }

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: _buildbutton(),
        body: SafeArea(
          child: SizedBox(
            child: Column(
              children: <Widget>[
                CustomAppBar(
                  title: '',
                  onLeadingTap: () {
                    if (currentIndex == 0) {
                      Get.back();
                      return;
                    } else {
                      controller.previousPage(
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 400),
                      );
                    }
                  },
                  actions: [
                    TextButton(
                        onPressed: () {
                          getIt<SharedPreferences>().setskipintro = 'true';

                          Get.offNamed(AppRoutes.login);
                        },
                        child: Text(
                          Lang.of(context).lbl_skip,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))
                  ],
                ),
                Flexible(
                  child: PageView.builder(
                    controller: controller,
                    itemCount: contents.length,
                    allowImplicitScrolling: false,
                    onPageChanged: (val) {
                      setState(() {
                        currentIndex = val;
                      });
                    },
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          buildSizedBoxH(42),
                          _buildimage(index),
                          buildSizedBoxH(37),
                          _buildTitle(index),
                          buildSizedBoxH(16),
                          _buildDescription(context),
                          buildSizedBoxH(35),
                          _buildindicator(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(int index) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: contents[index].title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 25.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            TextSpan(
              text: " ${contents[index].subtitle}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 25.0.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _buildDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: Text(
        Lang.of(context).lbl_onboarding_one_subtitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w400,
            color: ThemeData().customColors.onboardingH1Color),
      ),
    );
  }

  Widget _buildindicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: contents.length,
      effect: ExpandingDotsEffect(
        dotHeight: 4,
        dotWidth: 5,
        expansionFactor: 4,
        spacing: 12,
        activeDotColor: Theme.of(context).primaryColor,
        dotColor: ThemeData().customColors.greyColor,
      ),
    );
  }

  Widget _buildimage(int index) {
    return CustomImageView(
      imagePath: contents[index].image,
      height: 325.h,
    );
  }

  Widget _buildbutton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0.w, vertical: 35.0.h),
      child: CustomElevatedButton(
        onPressed: () {
          if (currentIndex != contents.length - 1) {
            controller.nextPage(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 400),
            );
          } else {
            getIt<SharedPreferences>().setskipintro = 'true';
            Get.offNamed(AppRoutes.login);
          }
        },
        text: currentIndex != contents.length - 1
            ? Lang.current.lbl_next
            : Lang.current.lbl_start_now,
      ),
    );
  }
}
