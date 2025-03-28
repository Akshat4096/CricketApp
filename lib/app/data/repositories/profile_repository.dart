import 'package:ny_cricket_app/app/data/api_client/api_client.dart';
import 'package:ny_cricket_app/app/data/api_endpoints/api_end_points.dart';
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
}
