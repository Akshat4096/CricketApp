// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i497;

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ny_cricket_app/app/controller/app_controller.dart' as _i388;
import 'package:ny_cricket_app/app/controller/auth_controller.dart' as _i1016;
import 'package:ny_cricket_app/app/controller/home_controller.dart' as _i128;
import 'package:ny_cricket_app/app/controller/profile_controller.dart' as _i50;
import 'package:ny_cricket_app/app/utils/helpers/injectable%20properties/injectable_properties.dart'
    as _i748;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.pref(),
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i388.AppController>(() => _i388.AppController());
    gh.lazySingleton<_i1016.AuthController>(
      () => _i1016.AuthController(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i128.HomeController>(() => _i128.HomeController());
    gh.lazySingleton<_i50.ProfileController>(() => _i50.ProfileController());
    await gh.factoryAsync<_i497.Directory>(
      () => registerModule.temporaryDirectory(),
      instanceName: 'temporary',
      preResolve: true,
    );
    await gh.factoryAsync<_i497.Directory>(
      () => registerModule.documentDirectory(),
      instanceName: 'document',
      preResolve: true,
    );
    gh.lazySingleton<_i748.AppDirectory>(() => _i748.AppDirectory(
          temporaryDirectory: gh<_i497.Directory>(instanceName: 'temporary'),
          documentDirectory: gh<_i497.Directory>(instanceName: 'document'),
        ));
    return this;
  }
}

class _$RegisterModule extends _i748.RegisterModule {}
