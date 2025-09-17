// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_instagram_clone/configs/network/dio_module.dart' as _i154;
import 'package:app_instagram_clone/configs/network/interceptors/auth_interceptor.dart'
    as _i508;
import 'package:app_instagram_clone/configs/network/interceptors/logger_interceptor.dart'
    as _i334;
import 'package:app_instagram_clone/cores/helpers/validations/email/abs_email_validate.dart'
    as _i488;
import 'package:app_instagram_clone/cores/helpers/validations/email/imp_email_validate.dart'
    as _i413;
import 'package:app_instagram_clone/cores/helpers/validations/password/abs_password_validate.dart'
    as _i884;
import 'package:app_instagram_clone/cores/helpers/validations/password/imp_password_validate.dart'
    as _i610;
import 'package:app_instagram_clone/cores/storage/abstraction/abs_auth_token_storage.dart'
    as _i993;
import 'package:app_instagram_clone/cores/storage/implementation/imp_auth_token_storage.dart'
    as _i789;
import 'package:app_instagram_clone/features/auth/data/datasources/remote/auth_datasource_remote.dart'
    as _i939;
import 'package:app_instagram_clone/features/auth/data/implement_repositories/imp_auth_repostitory.dart'
    as _i154;
import 'package:app_instagram_clone/features/auth/data/mappers/auth_mapper.dart'
    as _i620;
import 'package:app_instagram_clone/features/auth/domain/abstract_repositories/abs_auth_repository.dart'
    as _i719;
import 'package:app_instagram_clone/features/auth/domain/usecases/sign_in/strategy/implementations/sign_in_with_userpass_strategy.dart'
    as _i441;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i620.AuthMapper>(() => _i620.AuthMapper());
    gh.lazySingleton<_i508.AuthInterceptor>(() => _i508.AuthInterceptor());
    gh.lazySingleton<_i334.LoggerInterceptor>(() => _i334.LoggerInterceptor());
    gh.lazySingleton<_i993.AbsAuthTokenStorage>(
      () => _i789.ImpAuthTokenStorage(),
    );
    gh.lazySingleton<_i488.AbsEmailValidate>(() => _i413.ImpEmailValidate());
    gh.lazySingleton<_i884.AbsPasswordValidate>(
      () => _i610.ImpPasswordValidate(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(
        gh<_i508.AuthInterceptor>(),
        gh<_i334.LoggerInterceptor>(),
      ),
    );
    gh.lazySingleton<_i939.AuthDatasourceRemote>(
      () => _i939.AuthDatasourceRemote.new(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i719.AbsAuthRepository>(
      () => _i154.ImpAuthRepostitory(
        authMapper: gh<_i620.AuthMapper>(),
        authDatasourceRemote: gh<_i939.AuthDatasourceRemote>(),
        absAuthTokenStorage: gh<_i993.AbsAuthTokenStorage>(),
      ),
    );
    gh.lazySingleton<_i441.SignInWithUserpassStrategy>(
      () => _i441.SignInWithUserpassStrategy(
        authRepository: gh<_i719.AbsAuthRepository>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i154.DioModule {}
