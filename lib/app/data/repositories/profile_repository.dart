import 'package:ny_cricket_app/app/data/api_client/api_client.dart';
import 'package:ny_cricket_app/app/data/api_endpoints/api_end_points.dart';
import 'package:ny_cricket_app/app/ui/pages/profile/model/edit_profile_model.dart';
import 'package:ny_cricket_app/app/ui/pages/profile/model/profile_model.dart';
import 'package:ny_cricket_app/app/utils/helpers/logger.dart';

class ProfileRepository {
  final ApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<ProfileModel> getProfile() async {
    try {
      var response = await apiClient.request(
          RequestType.GET, AppConfig.baseUrl + EndPoints.profile,
          withoutMessage: true);

      return ProfileModel.fromJson(response);
    } catch (e) {
      Logger.log('Error get Profile data: $e');
      rethrow;
    }
  }

  Future<EditProfileModel> editProfile(
      {required String name,
      required String profileimage,
      required String password}) async {
    try {
      final Map<String, dynamic> postData = {
        "profile_image": profileimage,
        "name": name,
        "password": password,
      };

      var response = await apiClient.request(
          RequestType.MULTIPART_POST, AppConfig.baseUrl + EndPoints.editprofile,
          multipartData: postData);

      return EditProfileModel.fromJson(response);
    } catch (e) {
      Logger.log('Error edit Profile data: $e');
      rethrow;
    }
  }
}
