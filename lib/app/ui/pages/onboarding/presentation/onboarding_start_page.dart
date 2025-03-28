import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/app_button.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/extensions/extensions.dart';
import 'package:ny_cricket_app/app/utils/helpers/injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static Widget builder(BuildContext context) {
    return const OnboardingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                _buildOnboardingimage(),
                _buildTitle(context),
                buildSizedBoxH(16),
                _buildDescription(context),
              ],
            ),
          ),
          _buildbutton(context),
          buildSizedBoxH(84),
        ],
      ),
    );
  }

  Widget _buildOnboardingimage() {
    return CustomImageView(
      imagePath: AssetConstants.pngOnboardingOne,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: Lang.of(context).lbl_welcome_to,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 25.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            TextSpan(
              text: Lang.of(context).lbl_cricket_world,
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

  Widget _buildbutton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: CustomElevatedButton(
        onPressed: () {
          getIt<SharedPreferences>().setskipintro = 'true';
          Get.offAllNamed(AppRoutes.onboardingPage);
        },
        text: Lang.of(context).lbl_next,
      ),
    );
  }
}
