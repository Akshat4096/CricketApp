import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final double elevation;
  final VoidCallback? onLeadingTap;
  final Color? iconcolor;

  const CustomAppBar(
      {super.key,
      this.title = "",
      this.centerTitle = false,
      this.actions,
      this.leading,
      this.backgroundColor,
      this.elevation = 4.0,
      this.onLeadingTap,
      this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      actions: actions,
      leading: leading ??
          CustomImageView(
            imagePath: AssetConstants.icArrowLeft,
            margin: const EdgeInsets.all(15.0),
            color: iconcolor,
            onTap: onLeadingTap ??
                () {
                  Get.back();
                },
          ),
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
