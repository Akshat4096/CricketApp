import 'package:ny_cricket_app/app/data/api_client/api_client.dart';
import 'package:ny_cricket_app/app/data/api_endpoints/api_end_points.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/model/forgot_password_model.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/model/register_model.dart';
import 'package:ny_cricket_app/app/ui/pages/authentication/model/signin_model.dart';
import 'package:ny_cricket_app/app/utils/helpers/logger.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<SignUpModel> registerApi({
    required String name,
    required String email,
    required String password,
    required String referalcode,
  }) async {
    try {
      final Map<String, dynamic> postData = {
        "name": name,
        "email": email,
        "password": password,
        "referal_code": referalcode
      };

      var response = await apiClient.request(
          RequestType.POST, AppConfig.baseUrl + EndPoints.register,
          data: postData);

      return SignUpModel.fromJson(response);
    } catch (e) {
      Logger.log('Error posting register data: $e');
      rethrow;
    }
  }

  Future<SigninModel> loginapi({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> postData = {
        "email": email,
        "password": password,
      };

      var response = await apiClient.request(
          RequestType.POST, AppConfig.baseUrl + EndPoints.login,
          data: postData);

      return SigninModel.fromJson(response);
    } catch (e) {
      Logger.log('Error posting login data: $e');
      rethrow;
    }
  }

  Future<ForgotPasswordModel> forgotpassword({
    required String email,
  }) async {
    try {
      final Map<String, dynamic> postData = {"email": email};

      var response = await apiClient.request(
          RequestType.POST, AppConfig.baseUrl + EndPoints.forgotpassword,
          data: postData);

      return ForgotPasswordModel.fromJson(response);
    } catch (e) {
      Logger.log('Error posting forgot password data: $e');
      rethrow;
    }
  }

  Future<SignUpModel> verifyotp({
    required String email,
    required String otp,
  }) async {
    try {
      final Map<String, dynamic> postData = {"email": email, 'otp': otp};

      var response = await apiClient.request(
          RequestType.POST, AppConfig.baseUrl + EndPoints.verifyotp,
          data: postData);

      return SignUpModel.fromJson(response);
    } catch (e) {
      Logger.log('Error posting verify otp data: $e');
      rethrow;
    }
  }

  Future<SignUpModel> resetPassword({
    required String password,
  }) async {
    try {
      final Map<String, dynamic> postData = {"password": password};

      var response = await apiClient.request(
          RequestType.POST, AppConfig.baseUrl + EndPoints.resetpassword,
          data: postData);

      return SignUpModel.fromJson(response);
    } catch (e) {
      Logger.log('Error posting Reset password data: $e');
      rethrow;
    }
  }
}
