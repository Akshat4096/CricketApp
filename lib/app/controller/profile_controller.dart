import 'dart:io';
import 'package:ny_cricket_app/app/controller/auth_controller.dart';
import 'package:ny_cricket_app/app/data/api_client/api_client.dart';
import 'package:ny_cricket_app/app/data/api_endpoints/api_end_points.dart';
import 'package:ny_cricket_app/app/data/repositories/profile_repository.dart';
import 'package:ny_cricket_app/app/global/global.dart';
import 'package:ny_cricket_app/app/ui/pages/profile/model/edit_profile_model.dart';
import 'package:ny_cricket_app/app/ui/pages/profile/model/profile_model.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:injectable/injectable.dart' as i;
import 'package:ny_cricket_app/app/utils/helpers/extensions/extensions.dart';
import 'package:ny_cricket_app/app/utils/helpers/injectable/injectable.dart';
import 'package:ny_cricket_app/app/utils/helpers/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

@i.lazySingleton
@i.injectable
class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profileData = Rxn<ProfileModel>();
  var referalpoints = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (!Get.isRegistered<AuthController>()) {
      Get.put(AuthController());
    }
  }

  Future<void> fetchProfile() async {
    Loading.show();
    try {
      ProfileRepository profileRepository =
          ProfileRepository(apiClient: ApiClient());
      ProfileModel profile = await profileRepository.getProfile();
      profileData.value = profile;
      referalpoints.value = profile.data.referalPoints;
      Loading.dismiss();
    } catch (e) {
      Loading.dismiss();
      Logger.log(e.toString());
    }
  }

  void logout() {
    Get.offAllNamed(AppRoutes.login);
    getIt<SharedPreferences>().cleartoken();
  }

  //EDIT PROFILE
  final editprofileformKey = GlobalKey<FormState>();
  final editnameController = TextEditingController();
  final editpasswordController = TextEditingController();
  final editemailController = TextEditingController();

  final editnameFocusNode = FocusNode();
  final editpasswordFocusNode = FocusNode();
  final editemailFocusNode = FocusNode();
  var iseditPasswordVisible = false.obs;
  var editProfileData = Rxn<EditProfileModel>();

  void edittogglePasswordVisibility() {
    iseditPasswordVisible.value = !iseditPasswordVisible.value;
  }

  final selectedImage = Rxn<File>();
  var editprofileisLoading = false.obs;

  Future<void> editProfilecall() async {
    if (!editprofileformKey.currentState!.validate()) return;
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    editprofileisLoading.value = true;
    try {
      ProfileRepository profileRepository =
          ProfileRepository(apiClient: ApiClient());

      EditProfileModel editprofileModel = await profileRepository.editProfile(
        name: editnameController.text.trim(),
        profileimage: selectedImage.value?.path ?? "",
        password: editpasswordController.text.trim(),
      );
      if (editprofileModel.status == true) {
        editProfileData.value = editprofileModel;
        await fetchProfile();
        Get.back();
        editpasswordController.clear();
        profileImageNotifier.value =
            AppConfig.mainUrl + editprofileModel.updatedProfile.profileImage;
      }
    } catch (e) {
      Logger.log(e.toString());
    } finally {
      editprofileisLoading.value = false;
    }
  }
}
