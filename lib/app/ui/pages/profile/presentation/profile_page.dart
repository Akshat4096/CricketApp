import 'package:ny_cricket_app/app/controller/profile_controller.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';
import 'package:ny_cricket_app/app/global/asset_constants.dart';
import 'package:ny_cricket_app/app/ui/pages/profile/widgets/profile_page_shimmer.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/app_button.dart';
import 'package:ny_cricket_app/app/ui/widgets/common/image_view.dart';
import 'package:ny_cricket_app/app/ui/widgets/custom/custom_app_bar.dart';
import 'package:ny_cricket_app/app/ui/widgets/custom/custom_dialog_widget.dart';
import 'package:ny_cricket_app/app/utils/helpers/dimenson.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/getItHook/getit_hook.dart';
import 'package:toastification/toastification.dart';

class ProfilePage extends GetItHook<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: Obx(() => Visibility(
          visible: !controller.isLoading.value,
          child: _buildLogoutButton(context))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 16),
          child: Obx(() {
            if (controller.isLoading.value) {
              return ProfilePageShimmer();
            }
            return Column(
              children: [
                _buildProfilePictureSection(context),
                buildSizedBoxH(20),
                _buildNameSection(context, controller),
                buildSizedBoxH(8),
                _buildEmailSection(context, controller),
                buildSizedBoxH(40),
                _buildMenuSection(context, controller),
              ],
            );
          }),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Lang.of(context).lbl_my_profile,
      centerTitle: true,
      iconcolor: ThemeData().customColors.whiteColor,
    );
  }

  Widget _buildProfilePictureSection(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            child: ClipOval(
              child: CustomImageView(
                margin: EdgeInsets.all(4),
                imagePath: AssetConstants.pngSuccess,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomImageView(
              imagePath: AssetConstants.icCamera,
              height: 30.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameSection(BuildContext context, ProfileController controller) {
    return Obx(() => Text(
          controller.profileData.value?.data.name ?? '',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18.0.sp,
                color: Theme.of(context).primaryColor,
              ),
        ));
  }

  Widget _buildEmailSection(
      BuildContext context, ProfileController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text(
              controller.profileData.value?.data.email ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16.0.sp),
            )),
        const SizedBox(width: 8),
        CustomImageView(imagePath: AssetConstants.icEditProfile, height: 22.h),
      ],
    );
  }

  Widget _buildMenuSection(BuildContext context, ProfileController controller) {
    return Column(
      children: [
        Obx(() => _buildMenuItem(
            icon: AssetConstants.icMatchHistory,
            title: controller.profileData.value?.data.referalCode ?? '',
            onTap: () {
              Clipboard.setData(ClipboardData(
                  text: controller.profileData.value?.data.referalCode ?? ''));
              toastification.show(
                type: ToastificationType.info,
                showProgressBar: false,
                title: Text('Text copied to clipboard!',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ThemeData().customColors.blackColor)),
                autoCloseDuration: const Duration(seconds: 3),
              );
            },
            context: context,
            trailing: AssetConstants.icCopy)),
        buildSizedBoxH(16),
        Obx(() => _buildMenuItem(
              icon: AssetConstants.icSetting,
              title:
                  controller.profileData.value?.data.referalPoints.toString() ??
                      '',
              onTap: () {},
              context: context,
            )),
        buildSizedBoxH(16),
        _buildMenuItem(
          icon: AssetConstants.icMatchHistory,
          title: 'Match History',
          onTap: () {},
          context: context,
        ),
        buildSizedBoxH(16),
        _buildMenuItem(
          icon: AssetConstants.icSetting,
          title: 'Settings',
          onTap: () {},
          context: context,
        ),
      ],
    );
  }

  Widget _buildMenuItem(
      {required String icon,
      required String title,
      String? trailing,
      required VoidCallback onTap,
      required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeData().customColors.textfieldfillcolor,
          borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        leading: CustomImageView(imagePath: icon, height: 36.h),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 14.0.sp),
        ),
        trailing: CustomImageView(
          imagePath: trailing,
          height: 22.h,
          color: Theme.of(context).primaryColor,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 25.0.h),
      child: CustomElevatedButton(
        text: Lang.of(context).lbl_logout,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                icon: AssetConstants.pngSuccess,
                message: Lang.of(context).lbl_logout_text,
                buttonText: Lang.of(context).lbl_no,
                secondButtonText: Lang.of(context).lbl_yes,
                onSecondButtonPressed: controller.logout,
                onButtonPressed: () {
                  Get.back();
                },
              );
            },
          );
        },
      ),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {
    controller.fetchProfile();
  }
}
