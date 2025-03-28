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

class ResetPasswordPage extends GetItHook<AuthController> {
  @override
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Lang.of(context).lbl_create_new_password,
        centerTitle: true,
        iconcolor: ThemeData().customColors.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSizedBoxH(40),
              _buildTitleAndTaglineText(context),
              buildSizedBoxH(36),
              Form(
                key: controller.resetformKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(
                        Lang.of(context).lbl_create_new_password, context),
                    buildSizedBoxH(17),
                    _buildPasswordField(context),
                    buildSizedBoxH(30),
                    _buildTitle(Lang.of(context).lbl_confirm_password, context),
                    buildSizedBoxH(17),
                    _buildconfirmPasswordField(context),
                    buildSizedBoxH(270),
                    _buildResetPasswordButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndTaglineText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0.w),
      child: Text(
        Lang.of(context).lbl_reset_password_subtitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0.sp,
              color: ThemeData().customColors.onboardingH1Color,
            ),
      ),
    );
  }

  Widget _buildTitle(String title, BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18.5.sp),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Obx(
      () => CricketAppTextFormField(
        context: context,
        textInputType: TextInputType.visiblePassword,
        hintText: Lang.of(context).lbl_password_hint,
        prefixIcon: CustomImageView(
          imagePath: AssetConstants.icPassword,
          height: 26.0.h,
          margin: EdgeInsets.all(16.0),
        ),
        suffixIcon: CustomImageView(
          onTap: controller.togglePasswordVisibility,
          imagePath: (controller.isPasswordVisible.value
              ? AssetConstants.icEyeShow
              : AssetConstants.icEyeHide),
          height: 26.0.h,
          margin: EdgeInsets.all(16.0),
        ),
        obscureText: !controller.isPasswordVisible.value,
        controller: controller.createNewPasswordController,
        focusNode: controller.createNewPasswordFocusNode,
        validator: AppValidations.validatePassword,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context)
              .requestFocus(controller.confirmPasswordFocusNode);
        },
      ),
    );
  }

  Widget _buildconfirmPasswordField(BuildContext context) {
    return Obx(
      () => CricketAppTextFormField(
        context: context,
        textInputType: TextInputType.visiblePassword,
        hintText: Lang.of(context).lbl_password_hint,
        prefixIcon: CustomImageView(
          imagePath: AssetConstants.icPassword,
          height: 26.0.h,
          margin: EdgeInsets.all(16.0),
        ),
        suffixIcon: CustomImageView(
          onTap: controller.toggleConfirmPasswordVisibility,
          imagePath: (controller.isConfirmPasswordVisible.value
              ? AssetConstants.icEyeShow
              : AssetConstants.icEyeHide),
          height: 26.0.h,
          margin: EdgeInsets.all(16.0),
        ),
        obscureText: !controller.isConfirmPasswordVisible.value,
        controller: controller.confirmPasswordController,
        focusNode: controller.passwordFocusNode,
        validator: (value) => AppValidations.validateConfirmPassword(
          value,
          controller.createNewPasswordController.text,
        ),
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _buildResetPasswordButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0.w),
      child: Obx(
        () => CustomElevatedButton(
          isDisabled: controller.isLoading.value,
          isLoading: controller.isLoading.value,
          text: Lang.of(context).lbl_next,
          onPressed: controller.resetPassword,
        ),
      ),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onInit() {}

  @override
  void onDispose() {
    controller.createNewPasswordController.clear();
    controller.confirmPasswordController.clear();
  }
}
