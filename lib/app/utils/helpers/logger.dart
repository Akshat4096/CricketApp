// ignore_for_file: avoid_print

import 'dart:developer' as dev;
import 'package:ny_cricket_app/app/data/api_endpoints/api_end_points.dart';

class Logger {
  static void log(String message) {
    if (AppConfig.enableLogging) {
      final time = DateTime.now().toIso8601String();
      print('[$time] $message'); // Logs with a timestamp
    }
  }

  static void logError(String message,
      {dynamic error, StackTrace? stackTrace}) {
    if (AppConfig.enableLogging) {
      final time = DateTime.now().toIso8601String();
      print('[$time] ERROR: $message');
      if (error != null) print('[$time] ERROR Details: $error');
      if (stackTrace != null) print('[$time] StackTrace: $stackTrace');
    }
  }
}

extension LoggerExtension<T> on T? {
  T? get log {
    dev.log(toString());
    return this;
  }

  T? logWithName(String name) {
    dev.log(toString(), name: name);
    return this;
  }
}
