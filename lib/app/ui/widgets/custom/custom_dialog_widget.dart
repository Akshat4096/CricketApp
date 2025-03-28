import 'package:ny_cricket_app/app/ui/widgets/common/app_button.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class CustomDialog extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final String icon;
  final String? secondButtonText;
  final VoidCallback? onSecondButtonPressed;

  const CustomDialog({
    super.key,
    required this.message,
    this.buttonText = 'Done',
    required this.onButtonPressed,
    this.icon = '',
    this.secondButtonText,
    this.onSecondButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.0.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(44),
        decoration: BoxDecoration(
          color: ThemeData().customColors.textfieldfillcolor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon.isNotEmpty)
              CustomImageView(
                imagePath: icon,
                height: 65.0.h,
              ),
            buildSizedBoxH(20),
            Text(message,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 18.0.sp, fontWeight: FontWeight.w400)),
            buildSizedBoxH(25),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: buttonText,
                    onPressed: onButtonPressed,
                  ),
                ),
                if (secondButtonText != null && onSecondButtonPressed != null)
                  buildSizedboxW(20),
                if (secondButtonText != null && onSecondButtonPressed != null)
                  Expanded(
                    child: CustomElevatedButton(
                      text: secondButtonText!,
                      onPressed: onSecondButtonPressed!,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
