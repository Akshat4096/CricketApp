import 'package:ny_cricket_app/app/controller/auth_controller.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/app_button.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/app_textfield.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/getItHook/getit_hook.dart';
import 'package:ny_cricket_app/app/utils/helpers/validations/validations.dart';

class SignUpPage extends GetItHook<AuthController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildSizedBoxH(36),
                _buildSignUpTitleAndTaglineText(context),
                buildSizedBoxH(31),
                Form(
                  key: controller.registerformKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildtitle(Lang.of(context).lbl_name, context),
                      buildSizedBoxH(17),
                      CricketAppTextFormField(
                        context: context,
                        textInputType: TextInputType.name,
                        hintText: Lang.of(context).lbl_name_hint,
                        isCapitalized: true,
                        prefixIcon: CustomImageView(
                          imagePath: AssetConstants.icUser,
                          height: 26.0.h,
                          margin: EdgeInsets.all(16.0),
                        ),
                        controller: controller.nameController,
                        focusNode: controller.nameFocusNode,
                        validator: AppValidations.validateName,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(controller.signupemailFocusNode);
                        },
                      ),
                      buildSizedBoxH(30),
                      _buildtitle(Lang.of(context).lbl_email, context),
                      buildSizedBoxH(17),
                      CricketAppTextFormField(
                        context: context,
                        textInputType: TextInputType.emailAddress,
                        hintText: Lang.of(context).lbl_email_hint,
                        prefixIcon: CustomImageView(
                          imagePath: AssetConstants.icEmail,
                          height: 26.0.h,
                          margin: EdgeInsets.all(16.0),
                        ),
                        controller: controller.signupemailController,
                        focusNode: controller.signupemailFocusNode,
                        validator: AppValidations.validateEmail,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(controller.signuppasswordFocusNode);
                        },
                      ),
                      buildSizedBoxH(30),
                      _buildtitle(Lang.of(context).lbl_password, context),
                      buildSizedBoxH(17),
                      Obx(() => CricketAppTextFormField(
                            context: context,
                            textInputType: TextInputType.visiblePassword,
                            hintText: Lang.of(context).lbl_password_hint,
                            prefixIcon: CustomImageView(
                              imagePath: AssetConstants.icPassword,
                              height: 26.0.h,
                              margin: EdgeInsets.all(16.0),
                            ),
                            suffixIcon: CustomImageView(
                              onTap: () =>
                                  controller.isPasswordVisible.toggle(),
                              imagePath: controller.isPasswordVisible.value
                                  ? AssetConstants.icEyeShow
                                  : AssetConstants.icEyeHide,
                              height: 26.0.h,
                              margin: EdgeInsets.all(16.0),
                            ),
                            obscureText: !controller.isPasswordVisible.value,
                            controller: controller.signuppasswordController,
                            focusNode: controller.signuppasswordFocusNode,
                            validator: (value) =>
                                AppValidations.validatePassword(value),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(
                                  controller.confirmPasswordFocusNode);
                            },
                          )),
                      buildSizedBoxH(30),
                      _buildtitle(
                          Lang.of(context).lbl_confirm_password, context),
                      buildSizedBoxH(17),
                      Obx(() => CricketAppTextFormField(
                            context: context,
                            textInputType: TextInputType.visiblePassword,
                            hintText: Lang.of(context).lbl_password_hint,
                            prefixIcon: CustomImageView(
                              imagePath: AssetConstants.icPassword,
                              height: 26.0.h,
                              margin: EdgeInsets.all(16.0),
                            ),
                            suffixIcon: CustomImageView(
                              onTap: () =>
                                  controller.isConfirmPasswordVisible.toggle(),
                              imagePath:
                                  controller.isConfirmPasswordVisible.value
                                      ? AssetConstants.icEyeShow
                                      : AssetConstants.icEyeHide,
                              height: 26.0.h,
                              margin: EdgeInsets.all(16.0),
                            ),
                            obscureText:
                                !controller.isConfirmPasswordVisible.value,
                            controller:
                                controller.signupconfirmPasswordController,
                            focusNode: controller.confirmPasswordFocusNode,
                            validator: (value) =>
                                AppValidations.validateConfirmPassword(
                                    value,
                                    controller
                                        .signupconfirmPasswordController.text),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(
                                  controller.referralCodeFocusNode);
                            },
                          )),
                      buildSizedBoxH(30),
                      _buildtitle(Lang.of(context).lbl_referral_code, context),
                      buildSizedBoxH(17),
                      CricketAppTextFormField(
                        context: context,
                        textInputType: TextInputType.text,
                        hintText: Lang.of(context).lbl_referral_code_hint,
                        prefixIcon: CustomImageView(
                          imagePath: AssetConstants.icUser,
                          height: 26.0.h,
                          margin: EdgeInsets.all(16.0),
                        ),
                        controller: controller.referralCodeController,
                        focusNode: controller.referralCodeFocusNode,
                        textInputAction: TextInputAction.done,
                      ),
                      buildSizedBoxH(38),
                      Obx(() => CustomElevatedButton(
                            isLoading: controller.issignupLoading.value,
                            isDisabled: controller.issignupLoading.value,
                            text: Lang.of(context).lbl_sign_up,
                            onPressed: controller.signUp,
                          )),
                      buildSizedBoxH(35),
                      _buildAlreadyHaveAnAccount(context),
                      buildSizedBoxH(16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpTitleAndTaglineText(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Lang.of(context).lbl_sign_up,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 26.0.sp)),
              buildSizedBoxH(9),
              Text(Lang.of(context).lbl_signup_subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16.0.sp, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildtitle(String title, BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18.5.sp),
    );
  }

  Widget _buildAlreadyHaveAnAccount(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {},
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: Lang.of(context).lbl_already_have_an_account,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.0.h),
                      child: InkWell(
                        onTap: () {
                          Get.offAllNamed(AppRoutes.login);
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Text(
                          Lang.of(context).lbl_signin,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      child: Container(
                        height: 1.0,
                        color: Theme.of(context).primaryColor,
                        width: Lang.of(context).lbl_sign_up.length * 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
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
    controller.nameController.clear();
    controller.signupemailController.clear();
    controller.signuppasswordController.clear();
    controller.signupconfirmPasswordController.clear();
    controller.referralCodeController.clear();
  }
}
