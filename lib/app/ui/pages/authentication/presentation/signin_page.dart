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

class SigninPage extends GetItHook<AuthController> {
  @override
  const SigninPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSizedBoxH(36),
              _buildTitleAndTaglineText(context),
              buildSizedBoxH(31),
              Obx(() => AbsorbPointer(
                    absorbing: controller.isloginLoading.value,
                    child: _buildLoginForm(context),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndTaglineText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Lang.of(context).lbl_signin,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 26.0.sp)),
        buildSizedBoxH(9),
        Text(Lang.of(context).lbl_signin_subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 16.0.sp)),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
      key: controller.loginformKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(Lang.of(context).lbl_email, context),
          buildSizedBoxH(17),
          CricketAppTextFormField(
            context: context,
            hintText: Lang.of(context).lbl_email_id,
            textInputType: TextInputType.emailAddress,
            prefixIcon: CustomImageView(
              imagePath: AssetConstants.icEmail,
              height: 26.0.h,
              margin: EdgeInsets.all(16.0),
            ),
            controller: controller.emailController,
            focusNode: controller.emailFocusNode,
            validator: AppValidations.validateEmail,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => FocusScope.of(context)
                .requestFocus(controller.passwordFocusNode),
          ),
          buildSizedBoxH(30),
          _buildTitle(Lang.of(context).lbl_password, context),
          buildSizedBoxH(17),
          Obx(() => CricketAppTextFormField(
                context: context,
                hintText: Lang.of(context).lbl_password_hint,
                textInputType: TextInputType.visiblePassword,
                prefixIcon: CustomImageView(
                  imagePath: AssetConstants.icPassword,
                  height: 26.0.h,
                  margin: EdgeInsets.all(16.0),
                ),
                controller: controller.passwordController,
                focusNode: controller.passwordFocusNode,
                validator: (value) => AppValidations.validateRequired(value,
                    fieldName: Lang.of(context).lbl_password),
                obscureText: !controller.isPasswordVisible.value,
                suffixIcon: CustomImageView(
                  onTap: controller.togglePasswordVisibility,
                  imagePath: controller.isPasswordVisible.value
                      ? AssetConstants.icEyeShow
                      : AssetConstants.icEyeHide,
                  height: 26.0.h,
                  margin: EdgeInsets.all(16.0),
                ),
              )),
          buildSizedBoxH(20),
          _buildRememberMe(context),
          buildSizedBoxH(85),
          _buildSignInButton(context),
          buildSizedBoxH(21),
          _buildortext(context),
          buildSizedBoxH(28),
          // _buildSocailMedia(),
          // buildSizedBoxH(35),
          _buildDontHaveAnAccount(context),
          buildSizedBoxH(16),
        ],
      ),
    );
  }

  Widget _buildTitle(String title, BuildContext context) {
    return Text(title,
        style:
            Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18.sp));
  }

  Widget _buildRememberMe(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: controller.isRememberMeChecked.value,
              onChanged: (_) => controller.toggleRememberMe(),
            ),
            Text(
              Lang.of(context).lbl_remember_me,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 14.sp),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.toNamed(AppRoutes.forgotPassword);
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Text(
            Lang.of(context).lbl_forgot_password,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Center(
      child: Obx(() => CustomElevatedButton(
            isDisabled: controller.isloginLoading.value,
            isLoading: controller.isloginLoading.value,
            text: Lang.of(context).lbl_signin,
            onPressed: controller.signIn,
          )),
    );
  }

  Widget _buildortext(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        Lang.of(context).lbl_or,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14.sp, color: ThemeData().customColors.greyColor),
      ),
    );
  }

  // Widget _buildSocailMedia() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       CustomImageView(
  //         imagePath: AssetConstants.icGoogle,
  //         onTap: () {

  //         },
  //         height: 50.0.h,
  //       ),
  //       buildSizedboxW(23),
  //       CustomImageView(
  //         imagePath: AssetConstants.icFacebook,
  //         onTap: () {},
  //         height: 50.0.h,
  //       ),
  //       buildSizedboxW(23),
  //       CustomImageView(
  //         imagePath: AssetConstants.icX,
  //         height: 50.0.h,
  //         onTap: () {},
  //       )
  //     ],
  //   );
  // }

  Widget _buildDontHaveAnAccount(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: Lang.of(context).lbl_dont_have_an_account,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.register);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 3.0.h),
                      child: Text(
                        Lang.of(context).lbl_sign_up,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onInit() {}

  @override
  void onDispose() {
    controller.emailController.clear();
    controller.passwordController.clear();
  }
}
