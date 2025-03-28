import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ny_cricket_app/app/generated/l10n.dart';

class UserFriendlyError {
  final String title;
  final String description;

  UserFriendlyError(this.title, this.description);
}

extension DioExceptionTypeExtension on DioExceptionType {
  UserFriendlyError toUserFriendlyError(BuildContext context) {
    switch (this) {
      case DioExceptionType.connectionTimeout:
        return UserFriendlyError(Lang.of(context).err_connection_timeout,
            Lang.of(context).err_connection_timeout_description);
      case DioExceptionType.sendTimeout:
        return UserFriendlyError(Lang.of(context).err_connection_timeout,
            Lang.of(context).err_connection_timeout_description);
      case DioExceptionType.receiveTimeout:
        return UserFriendlyError(Lang.of(context).err_data_reception_issue,
            Lang.of(context).err_data_reception_issue_description);
      case DioExceptionType.badCertificate:
        return UserFriendlyError(
            Lang.of(context).err_security_certificate_problem,
            Lang.of(context).err_security_certificate_problem_description);
      case DioExceptionType.badResponse:
        return UserFriendlyError(
            Lang.of(context).err_unexpected_server_response,
            Lang.of(context).err_unexpected_server_response_description);
      case DioExceptionType.cancel:
        return UserFriendlyError(Lang.of(context).err_request_cancelled,
            Lang.of(context).err_request_cancelled_description);
      case DioExceptionType.connectionError:
        return UserFriendlyError(Lang.of(context).err_connection_issue,
            Lang.of(context).err_connection_issue_description);
      case DioExceptionType.unknown:
        return UserFriendlyError(Lang.of(context).err_unknown_error,
            Lang.of(context).err_unknown_error_description);
    }
  }
}
