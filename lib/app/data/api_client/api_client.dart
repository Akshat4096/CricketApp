// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart' as dio;
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/extensions/extensions.dart';
import 'package:ny_cricket_app/app/utils/helpers/injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

enum RequestType { GET, POST, PUT, DELETE, MULTIPART_POST }

class ApiClient {
  final dio.Dio _dio;

  ApiClient()
      : _dio = dio.Dio(dio.BaseOptions(
          headers: _buildHeaders(),
        )) {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  // Method to build headers for HTTP requests
  static Map<String, String> _buildHeaders() {
    final headers = <String, String>{'Content-Type': 'application/json'};
    String? authToken = getIt<SharedPreferences>().getToken ?? '';
    if (authToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $authToken';
    }
    return headers;
  }

  Future<Map<String, dynamic>> request(
    RequestType requestType,
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? multipartData,
    bool withoutMessage = false,
  }) async {
    dio.Response response;

    try {
      switch (requestType) {
        case RequestType.GET:
          response = await _dio.get(path);
          break;
        case RequestType.POST:
          response = await _dio.post(path, data: data);
          break;
        case RequestType.PUT:
          response = await _dio.put(path, data: data);
          break;
        case RequestType.DELETE:
          response = await _dio.delete(path);
          break;
        case RequestType.MULTIPART_POST:
          dio.FormData formData = dio.FormData();
          if (multipartData != null && multipartData.isNotEmpty) {
            var entry = multipartData.entries.first;
            if (entry.value is List && entry.value.isNotEmpty) {
              var filepath = entry.value[0];
              formData.files.add(
                MapEntry(
                  entry.key,
                  await dio.MultipartFile.fromFile(filepath),
                ),
              );
            } else {
              formData.files.add(MapEntry(
                entry.key,
                await dio.MultipartFile.fromFile(entry.value),
              ));
            }
          }

          response = await _dio.post(
            path,
            data: formData,
          );
          break;
      }

      return withoutMessage
          ? _handlewithoutMessageResponse(response)
          : _handleResponse(response);
    } catch (error) {
      if (error is dio.DioException) {
        return withoutMessage
            ? _handleErrorWithoutMessage(error)
            : _handleError(error);
      } else {
        rethrow;
      }
    }
  }

  // Method to handle successful HTTP responses
  Map<String, dynamic> _handleResponse(dio.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.data['message'] != null) {
        toastification.show(
          type: ToastificationType.success,
          showProgressBar: false,
          title: Text(
            response.data['message'],
            style: GoogleFonts.montserrat(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          autoCloseDuration: const Duration(seconds: 3),
        );
      }

      return response.data;
    } else {
      throw _handleNonSuccessStatus(response);
    }
  }

  Map<String, dynamic> _handlewithoutMessageResponse(dio.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw _handleNonSuccessStatus(response);
    }
  }

  // Method to handle non-successful HTTP responses
  Map<String, dynamic> _handleNonSuccessStatus(dio.Response response) {
    if (response.statusCode == 400) {
      toastification.show(
        type: ToastificationType.error,
        showProgressBar: false,
        title: Text(
          response.data['message'],
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        autoCloseDuration: const Duration(seconds: 3),
      );
      throw dio.DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: dio.DioExceptionType.badResponse,
      );
    } else if (response.statusCode == 401) {
      Get.offAll(AppRoutes.login);
      toastification.show(
        type: ToastificationType.error,
        showProgressBar: false,
        title: Text(
          response.data['message'],
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        autoCloseDuration: const Duration(seconds: 3),
      );

      throw dio.DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: dio.DioExceptionType.unknown,
      );
    } else {
      toastification.show(
        type: ToastificationType.error,
        showProgressBar: false,
        title: Text(
          response.data['message'],
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        autoCloseDuration: const Duration(seconds: 3),
      );

      throw dio.DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: dio.DioExceptionType.badResponse,
      );
    }
  }

  //_handle Non Success Status Without Message
  Map<String, dynamic> _handleNonSuccessStatusWithoutMessage(
      dio.Response response) {
    if (response.statusCode == 400) {
      throw dio.DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: dio.DioExceptionType.badResponse,
      );
    } else if (response.statusCode == 401) {
      toastification.show(
        type: ToastificationType.error,
        showProgressBar: false,
        title: Text(
          response.data['message'],
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        autoCloseDuration: const Duration(seconds: 3),
      );
      Get.offAll(AppRoutes.login);
      throw dio.DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: dio.DioExceptionType.unknown,
      );
    } else {
      throw dio.DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: dio.DioExceptionType.badResponse,
      );
    }
  }

  // Method to handle Dio errors
  Map<String, dynamic> _handleError(dio.DioException error) {
    if (error.response != null) {
      return _handleNonSuccessStatus(error.response!);
    } else {
      toastification.show(
        type: ToastificationType.error,
        showProgressBar: false,
        title: Text(
          error.response?.data['message'],
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        autoCloseDuration: const Duration(seconds: 3),
      );
      throw dio.DioException(
        requestOptions: error.requestOptions,
        error: error.error,
        type: dio.DioExceptionType.unknown,
      );
    }
  }

  Map<String, dynamic> _handleErrorWithoutMessage(dio.DioException error) {
    if (error.response != null) {
      return _handleNonSuccessStatusWithoutMessage(error.response!);
    } else {
      throw dio.DioException(
        requestOptions: error.requestOptions,
        error: error.error,
        type: dio.DioExceptionType.unknown,
      );
    }
  }
}
