// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_instagram_clone/cores/configs/network/dio_config.dart'
    as _i387;
import 'package:app_instagram_clone/cores/configs/network/interceptors/auth_interceptor.dart'
    as _i512;
import 'package:app_instagram_clone/cores/configs/network/interceptors/logger_interceptor.dart'
    as _i744;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i512.AuthInterceptor>(() => _i512.AuthInterceptor());
    gh.lazySingleton<_i744.LoggerInterceptor>(() => _i744.LoggerInterceptor());
    gh.lazySingleton<_i387.DioConfig>(() => _i387.DioConfig(
          authInterceptor: gh<_i512.AuthInterceptor>(),
          loggerInterceptor: gh<_i744.LoggerInterceptor>(),
        ));
    return this;
  }
}
