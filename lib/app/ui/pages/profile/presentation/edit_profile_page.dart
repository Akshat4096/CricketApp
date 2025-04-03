import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ny_cricket_app/app/controller/profile_controller.dart';
import 'package:ny_cricket_app/app/data/api_endpoints/api_end_points.dart';
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
import 'package:toastification/toastification.dart';

class EditProfilePage extends GetItHook<ProfileController> {
  EditProfilePage({super.key});
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Lang.of(context).lbl_edit_profile,
      centerTitle: true,
      iconcolor: ThemeData().customColors.whiteColor,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 16),
        child: Form(
          key: controller.editprofileformKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSizedBoxH(25),
              _buildProfilePictureSection(context),
              buildSizedBoxH(20),
              _buildInputField(
                context,
                title: Lang.of(context).lbl_name,
                controller: controller.editnameController,
                focusNode: controller.editnameFocusNode,
                validator: AppValidations.validateName,
                textInputType: TextInputType.name,
                prefixIcon: AssetConstants.icUser,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context)
                    .requestFocus(controller.editemailFocusNode),
              ),
              _buildInputField(
                context,
                title: Lang.of(context).lbl_email,
                controller: controller.editemailController,
                focusNode: controller.editemailFocusNode,
                validator: AppValidations.validateEmail,
                textInputType: TextInputType.emailAddress,
                prefixIcon: AssetConstants.icEmail,
                readOnly: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context)
                    .requestFocus(controller.editpasswordFocusNode),
              ),
              _buildPasswordInputField(context),
              buildSizedBoxH(80),
              _buildSaveChangesButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePictureSection(BuildContext context) {
    return Obx(() => Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 60.r,
                backgroundImage: controller.selectedImage.value != null
                    ? FileImage(controller.selectedImage.value!)
                        as ImageProvider
                    : (controller.profileData.value?.data.profileImage ==
                                null ||
                            controller.profileData.value?.data.profileImage ==
                                '')
                        ? AssetImage(AssetConstants.pngSuccess)
                        : NetworkImage(AppConfig.mainUrl +
                            (controller.profileData.value?.data.profileImage ??
                                '')),
                child: controller.selectedImage.value == null &&
                        (controller.profileData.value?.data.profileImage ==
                                null ||
                            controller.profileData.value?.data.profileImage ==
                                '')
                    ? CustomImageView(imagePath: AssetConstants.pngSuccess)
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => _chooseActionDialog(context),
                  child: CustomImageView(
                    imagePath: AssetConstants.icCamera,
                    height: 30.h,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildInputField(
    BuildContext context, {
    required String title,
    required TextEditingController controller,
    required FocusNode focusNode,
    required String? Function(String?) validator,
    required TextInputType textInputType,
    required String prefixIcon,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 18.5.sp)),
        buildSizedBoxH(17),
        CricketAppTextFormField(
          context: context,
          textInputType: textInputType,
          hintText: title,
          prefixIcon: CustomImageView(
              imagePath: prefixIcon,
              height: 26.0.h,
              margin: EdgeInsets.all(16.0)),
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          readOnly: readOnly,
        ),
        buildSizedBoxH(30),
      ],
    );
  }

  Widget _buildPasswordInputField(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Lang.of(context).lbl_password,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18.5.sp)),
            buildSizedBoxH(17),
            CricketAppTextFormField(
              context: context,
              hintText: Lang.of(context).lbl_password_hint,
              textInputType: TextInputType.visiblePassword,
              prefixIcon: CustomImageView(
                imagePath: AssetConstants.icPassword,
                height: 26.0.h,
                margin: EdgeInsets.all(16.0),
              ),
              controller: controller.editpasswordController,
              focusNode: controller.editpasswordFocusNode,
              validator: (value) => AppValidations.validatePassword(value),
              obscureText: !controller.iseditPasswordVisible.value,
              suffixIcon: CustomImageView(
                onTap: controller.edittogglePasswordVisibility,
                imagePath: controller.iseditPasswordVisible.value
                    ? AssetConstants.icEyeShow
                    : AssetConstants.icEyeHide,
                height: 26.0.h,
                margin: EdgeInsets.all(16.0),
              ),
            ),
          ],
        ));
  }

  void _chooseActionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(Lang.of(context).lbl_choose_an_action),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildImagePickerButton(
                        context,
                        Lang.of(context).lbl_camera,
                        AssetConstants.icCameraSvg,
                        ImageSource.camera),
                  ),
                  Expanded(
                    child: _buildImagePickerButton(
                        context,
                        Lang.of(context).lbl_gallery,
                        AssetConstants.icGallery,
                        ImageSource.gallery),
                  ),
                ],
              ),
              buildSizedBoxH(20),
              CustomElevatedButton(
                  text: Lang.of(context).lbl_cancel,
                  onPressed: () => Get.back()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImagePickerButton(
      BuildContext context, String label, String icon, ImageSource source) {
    return GestureDetector(
      onTap: () => _pickImage(source),
      child: Column(children: [
        CustomImageView(imagePath: icon, height: 30.h),
        buildSizedBoxH(10),
        Text(label)
      ]),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        controller.selectedImage(File(pickedFile.path));
        Get.back();
      }
    } catch (e) {
      toastification.show(
        type: ToastificationType.error,
        showProgressBar: false,
        title: Text(
          Lang.of(Get.context!).lbl_failed_to_pick_an_image,
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        autoCloseDuration: const Duration(seconds: 3),
      );
    }
  }

  Widget _buildSaveChangesButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 25.0.h),
      child: CustomElevatedButton(
          isLoading: controller.editprofileisLoading.value,
          isDisabled: controller.editprofileisLoading.value,
          text: Lang.of(context).lbl_save_changes,
          onPressed: () {
            if (controller.editprofileformKey.currentState!.validate()) {
              FocusScope.of(context).unfocus();
              controller.editProfilecall();
            }
          }),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {
    controller.editemailController.text =
        controller.profileData.value?.data.email ?? '';
    controller.editnameController.text =
        controller.profileData.value?.data.name ?? '';
  }
}
