import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/data/data.dart';

@module
abstract class RegisterModule {
  ///
  @singleton
  Dio get dio => Dio()..interceptors.add(PrettyDioLogger());

  ///
  @singleton
  AuthClient get authClient => AuthClient(dio);

  ///
  @singleton
  TokenClient get tokenClient => TokenClient(dio);

  ///
  @lazySingleton
  FlutterSecureStorage get securedStorage => const FlutterSecureStorage();

  @lazySingleton
  @preResolve
  Future<SharedPreferences> get unsecuredStorage =>
      SharedPreferences.getInstance();
}
