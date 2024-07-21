// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:btk_todo/auth/bloc/login/login_bloc.dart' as _i12;
import 'package:btk_todo/auth/bloc/signup/signup_bloc.dart' as _i11;
import 'package:btk_todo/core/di/register_module.dart' as _i13;
import 'package:btk_todo/data/data.dart' as _i5;
import 'package:btk_todo/domain/auth_repository.dart' as _i8;
import 'package:btk_todo/domain/domain.dart' as _i9;
import 'package:btk_todo/domain/storage_repository.dart' as _i7;
import 'package:btk_todo/domain/token_repository.dart' as _i10;
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

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
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModule.unsecuredStorage,
      preResolve: true,
    );
    gh.singleton<_i4.Dio>(() => registerModule.dio);
    gh.singleton<_i5.AuthClient>(() => registerModule.authClient);
    gh.singleton<_i5.TokenClient>(() => registerModule.tokenClient);
    gh.singleton<_i6.FlutterSecureStorage>(() => registerModule.securedStorage);
    gh.factory<_i7.IStorageRepository>(() => _i7.StorageRepository(
          securedStorage: gh<_i6.FlutterSecureStorage>(),
          unsecuredStorage: gh<_i3.SharedPreferences>(),
        ));
    gh.singleton<_i8.IAuthRepository>(() => _i8.AuthRepository(
          authClient: gh<_i5.AuthClient>(),
          storageRepository: gh<_i9.IStorageRepository>(),
        ));
    gh.singleton<_i10.ITokenRepository>(() => _i10.TokenRepository(
          tokenClient: gh<_i5.TokenClient>(),
          storageRepository: gh<_i9.IStorageRepository>(),
        ));
    gh.factory<_i11.SignupBloc>(
        () => _i11.SignupBloc(tokenRepository: gh<_i9.ITokenRepository>()));
    gh.factory<_i12.LoginBloc>(
        () => _i12.LoginBloc(tokenRepository: gh<_i9.ITokenRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
