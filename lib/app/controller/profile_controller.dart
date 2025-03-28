import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ny_cricket_app/app/data/api_client/api_client.dart';
import 'package:ny_cricket_app/app/data/repositories/profile_repository.dart';
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
}
