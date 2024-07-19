import 'package:btk_todo/data/data.dart';
import 'package:btk_todo/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/core.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize [Service Locator]
  configureDependencies();
  final unsecuredStorage = await SharedPreferences.getInstance();

  final dio = Dio()
    ..interceptors.addAll([const AuthInterceptor(), PrettyDioLogger()]);
  final tokenClient = TokenClient(dio);

  final authClient = AuthClient(dio);
  final storageRepository = StorageRepository(
    securedStorage: const FlutterSecureStorage(),
    unsecuredStorage: unsecuredStorage,
  );

  final tokenRepository = TokenRepository(
    tokenClient: tokenClient,
    storageRepository: storageRepository,
  );

  final authRepository = AuthRepository(authClient: authClient);

  await tokenRepository.loginUser(
    request: const LoginRequest(
      username: 'ahm',
      password: 'sifre',
    ),
  );
  await authRepository.getAllUsers();

  ///
  runApp(
    ///
    const App(),
  );
}
