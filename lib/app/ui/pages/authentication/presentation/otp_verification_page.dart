import 'package:ny_cricket_app/app/controller/auth_controller.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/app_button.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/ui/widgets/custom/custom_app_bar.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/getItHook/getit_hook.dart';
import 'package:ny_cricket_app/app/utils/helpers/validations/validations.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends GetItHook<AuthController> {
  @override
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Lang.of(context).lbl_otp_verification,
        centerTitle: true,
        iconcolor: ThemeData().customColors.whiteColor,
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildSizedBoxH(54),
                      _buildVerifyOtpHeader(),
                      buildSizedBoxH(24),
                      _buildTitleText(context),
                      buildSizedBoxH(73),
                      AbsorbPointer(
                        absorbing: controller.otpisLoading.value,
                        child: _buildVerifyOtpForm(context),
                      ),
                      buildSizedBoxH(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyOtpHeader() {
    return CustomImageView(
      imagePath: AssetConstants.pngVerifyOtpHeader,
      height: 130.h,
    );
  }

  Widget _buildTitleText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: Column(
        children: [
          Text(
            Lang.of(context).lbl_6_digit_otp,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 16.0.sp),
          ),
          buildSizedBoxH(8),
          Text(
            Lang.of(context).lbl_otp_subtitle,
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

  Widget _buildVerifyOtpForm(BuildContext context) {
    return Form(
      key: controller.verifyotpformKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildtitle(Lang.of(context).lbl_otp, context),
          buildSizedBoxH(17),
          _buildOtpTextField(),
          buildSizedBoxH(15),
          _buildDidnotGetOtp(context),
          buildSizedBoxH(130),
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget _buildtitle(String title, BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18.5.sp),
    );
  }

  Widget _buildSendButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0.w),
      child: Obx(
        () => CustomElevatedButton(
          text: Lang.of(Get.context!).lbl_next,
          isDisabled: controller.otpisLoading.value,
          isLoading: controller.otpisLoading.value,
          onPressed: controller.verifyotp,
        ),
      ),
    );
  }

  Widget _buildOtpTextField() {
    return Center(
      child: Pinput(
        length: 6,
        controller: controller.otpController,
        focusNode: controller.otpFocusNode,
        pinAnimationType: PinAnimationType.slide,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        keyboardType: TextInputType.number,
        closeKeyboardWhenCompleted: true,
        showCursor: true,
        validator: AppValidations.validateOTP,
        focusedPinTheme: _buildFocusedPinTheme(),
        defaultPinTheme: _buildDefaultPinTheme(),
        errorPinTheme: _buildErrorPinTheme(),
      ),
    );
  }

  Widget _buildDidnotGetOtp(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: Lang.of(context).lbl_did_not_get_otp,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 17.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Stack(
                children: [
                  InkWell(
                    onTap: controller.verifyotp,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 3.0.h),
                      child: Text(
                        Lang.of(context).lbl_resend,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 17.0.sp,
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

  PinTheme _buildDefaultPinTheme() {
    return PinTheme(
      height: 60.h,
      width: 60.w,
      textStyle: Theme.of(Get.context!)
          .textTheme
          .bodyMedium
          ?.copyWith(fontSize: 17.sp),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ThemeData().customColors.textfieldfillcolor,
      ),
    );
  }

  PinTheme _buildFocusedPinTheme() {
    return PinTheme(
      height: 60.h,
      width: 60.w,
      textStyle: Theme.of(Get.context!)
          .textTheme
          .bodyMedium
          ?.copyWith(fontSize: 17.sp),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(Get.context!).primaryColor),
      ),
    );
  }

  PinTheme _buildErrorPinTheme() => _buildFocusedPinTheme();
  @override
  bool get canDisposeController => false;

  @override
  void onInit() {}

  @override
  void onDispose() {
    controller.otpController.clear();
  }
}
