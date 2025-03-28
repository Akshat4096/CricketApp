import 'package:google_fonts/google_fonts.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:pinput/pinput.dart';

class CustomOtpTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? otpController;
  final FocusNode? focusNode;
  final void Function(String)? onCompleted;

  const CustomOtpTextField({
    super.key,
    required this.validator,
    required this.otpController,
    required this.focusNode,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: 6,
        focusNode: focusNode ?? FocusNode(),
        controller: otpController,
        validator: validator,
        onCompleted: onCompleted,
        errorTextStyle: GoogleFonts.ubuntu(fontSize: 16.0.sp),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        keyboardType: TextInputType.number,
        closeKeyboardWhenCompleted: true,
        showCursor: true,
        preFilledWidget: Text(
          '-',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        focusedPinTheme: _buildFocusedPinTheme(context),
        defaultPinTheme: _buildDefaultPinTheme(context),
        errorPinTheme: _buildErrorPinTheme(context),
      ),
    );
  }

  PinTheme _buildDefaultPinTheme(BuildContext context) {
    return PinTheme(
      height: 48.h,
      width: 48.w,
      textStyle: Theme.of(context).textTheme.bodyMedium,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
    );
  }

  PinTheme _buildFocusedPinTheme(BuildContext context) {
    return PinTheme(
      height: 48.h,
      width: 48.w,
      textStyle: Theme.of(context).textTheme.bodyMedium,
      decoration: BoxDecoration(
        color: MyAppThemeHelper.secondaryColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
    );
  }

  PinTheme _buildErrorPinTheme(BuildContext context) {
    return PinTheme(
      height: 48.h,
      width: 48.w,
      textStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Theme.of(context).colorScheme.error),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
