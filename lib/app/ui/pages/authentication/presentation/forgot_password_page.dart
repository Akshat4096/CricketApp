import 'package:ny_cricket_app/app/controller/auth_controller.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/app_button.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/app_textfield.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/ui/widgets/custom/custom_app_bar.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/getItHook/getit_hook.dart';
import 'package:ny_cricket_app/app/utils/helpers/validations/validations.dart';

class ForgotPasswordPage extends GetItHook<AuthController> {
  @override
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Lang.of(context).lbl_forgot_password_title,
        centerTitle: true,
        iconcolor: ThemeData().customColors.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildSizedBoxH(54),
                    _buildForgotPasswordHeader(),
                    buildSizedBoxH(24),
                    _buildtitleText(context),
                    buildSizedBoxH(73),
                    Obx(() => AbsorbPointer(
                          absorbing: controller.forgotisLoading.value,
                          child: _buildForgotPasswordForm(context, controller),
                        )),
                    buildSizedBoxH(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForgotPasswordHeader() {
    return CustomImageView(
      imagePath: AssetConstants.pngForgotPasswordHeader,
      height: 130.h,
    );
  }

  Widget _buildtitleText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: Column(
        children: [
          Text(
            Lang.of(context).lbl_email,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 16.0.sp),
          ),
          buildSizedBoxH(8),
          Text(
            Lang.of(context).lbl_forgot_password_subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.0.sp,
                color: ThemeData().customColors.onboardingH1Color),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordForm(
      BuildContext context, AuthController controller) {
    return Form(
      key: controller.forgotformKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Lang.of(context).lbl_email,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 18.sp),
          ),
          buildSizedBoxH(17),
          CricketAppTextFormField(
            context: context,
            textInputType: TextInputType.emailAddress,
            hintText: Lang.of(context).lbl_email,
            prefixIcon: CustomImageView(
              imagePath: AssetConstants.icEmail,
              height: 26.0.h,
              margin: EdgeInsets.all(16.0),
            ),
            controller: controller.forgotemailController,
            focusNode: controller.forgotemailFocusNode,
            validator: AppValidations.validateEmail,
            textInputAction: TextInputAction.done,
          ),
          buildSizedBoxH(171),
          _buildSendButton(context, controller),
        ],
      ),
    );
  }

  Widget _buildSendButton(BuildContext context, AuthController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0.w),
      child: Obx(() => CustomElevatedButton(
            text: Lang.of(context).lbl_next,
            isDisabled: controller.forgotisLoading.value,
            isLoading: controller.forgotisLoading.value,
            onPressed: controller.forgotpassword,
          )),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onInit() {}

  @override
  void onDispose() {}
}
