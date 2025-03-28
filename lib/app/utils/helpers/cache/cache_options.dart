import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:ny_cricket_app/app/utils/helpers/injectable/injectable.dart';
import 'package:ny_cricket_app/app/utils/helpers/injectable%20properties/injectable_properties.dart';

final cacheOption = CacheOptions(
  store: HiveCacheStore(getIt<AppDirectory>().temporaryDirectory.path),
  hitCacheOnErrorExcept: [401, 403],
  maxStale: const Duration(days: 7),
  allowPostMethod: true,
);
