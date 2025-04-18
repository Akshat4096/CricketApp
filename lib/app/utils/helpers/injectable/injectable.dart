import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart' as i;
import 'package:ny_cricket_app/app/controller/ad_controller.dart';
import 'package:ny_cricket_app/app/utils/helpers/cache/cache_options.dart';
import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';
import 'package:ny_cricket_app/app/utils/helpers/injectable/injectable.config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

@i.injectableInit
void configuration({required Widget myApp}) {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();
    Get.lazyPut(() => AdController());
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await getIt.init();

    if (kDebugMode) {
      getIt<Dio>().interceptors.add(PrettyDioLogger());
    }

    getIt<Dio>().interceptors
      ..add(DioCacheInterceptor(options: cacheOption))
      ..add(RetryInterceptor(dio: getIt<Dio>()));

    runApp(myApp);
  }, (error, stackTrace) {
    Logger.log(error.toString());
  });
}
