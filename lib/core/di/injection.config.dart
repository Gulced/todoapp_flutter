// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:btk_todo/core/di/register_module.dart' as _i7;
import 'package:btk_todo/data/data.dart' as _i4;
import 'package:btk_todo/domain/auth_repository.dart' as _i5;
import 'package:btk_todo/domain/token_repository.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.Dio>(() => registerModule.dio);
    gh.singleton<_i4.AuthClient>(() => registerModule.authClient);
    gh.singleton<_i4.TokenClient>(() => registerModule.tokenClient);
    gh.lazySingleton<_i5.IAuthRepository>(
        () => _i5.AuthRepository(authClient: gh<_i4.AuthClient>()));
    gh.lazySingleton<_i6.ITokenRepository>(
        () => _i6.TokenRepository(tokenClient: gh<_i4.TokenClient>()));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
