// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:btk_todo/core/di/register_module.dart' as _i12;
import 'package:btk_todo/data/data.dart' as _i4;
import 'package:btk_todo/domain/auth_repository.dart' as _i7;
import 'package:btk_todo/domain/domain.dart' as _i11;
import 'package:btk_todo/domain/storage_repository.dart' as _i8;
import 'package:btk_todo/domain/token_repository.dart' as _i9;
import 'package:btk_todo/login/bloc/login_bloc.dart' as _i10;
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.Dio>(() => registerModule.dio);
    gh.singleton<_i4.AuthClient>(() => registerModule.authClient);
    gh.singleton<_i4.TokenClient>(() => registerModule.tokenClient);
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => registerModule.securedStorage);
    await gh.lazySingletonAsync<_i6.SharedPreferences>(
      () => registerModule.unsecuredStorage,
      preResolve: true,
    );
    gh.lazySingleton<_i7.IAuthRepository>(
        () => _i7.AuthRepository(authClient: gh<_i4.AuthClient>()));
    gh.singleton<_i8.IStorageRepository>(() => _i8.StorageRepository(
          securedStorage: gh<_i5.FlutterSecureStorage>(),
          unsecuredStorage: gh<_i6.SharedPreferences>(),
        ));
    gh.lazySingleton<_i9.ITokenRepository>(() => _i9.TokenRepository(
          tokenClient: gh<_i4.TokenClient>(),
          storageRepository: gh<InvalidType>(),
        ));
    gh.lazySingleton<_i10.LoginBloc>(
        () => _i10.LoginBloc(tokenRepository: gh<_i11.ITokenRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
