import 'package:flutter/cupertino.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.margin,
    this.onPressed,
    this.buttonStyle,
    this.alignment,
    this.buttonTextStyle,
    this.isDisabled = false,
    this.height,
    this.width,
    this.iconSpacing,
    this.isLoading = false,
    required this.text,
  });

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final Alignment? alignment;
  final TextStyle? buttonTextStyle;
  final bool isDisabled;
  final double? height;
  final double? width;
  final double? iconSpacing;
  final bool isLoading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      width: width ?? MediaQuery.of(context).size.width,
      margin: margin,
      decoration: decoration,
      child: ElevatedButton(
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0.r),
              ),
              padding: EdgeInsets.zero,
            ),
        onPressed: isDisabled
            ? null
            : () {
                HapticFeedback.lightImpact();
                if (onPressed != null) onPressed!();
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftIcon != null) leftIcon!,
            if (leftIcon != null && iconSpacing != null)
              SizedBox(width: iconSpacing),
            isLoading
                ? const CupertinoActivityIndicator()
                : Text(
                    text,
                    style: buttonTextStyle ??
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 19.5.sp,
                              fontWeight: FontWeight.w500,
                              color: isDisabled
                                  ? Theme.of(context).disabledColor
                                  : MyAppThemeHelper.blackColor,
                            ),
                  ),
            if (rightIcon != null && iconSpacing != null)
              SizedBox(width: iconSpacing),
            if (rightIcon != null) rightIcon!,
          ],
        ),
      ),
    );
  }
}
