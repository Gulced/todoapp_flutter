import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '/data/data.dart';

@module
abstract class RegisterModule {
  ///
  @singleton
  Dio get dio => Dio();

  ///
  @singleton
  AuthClient get authClient => AuthClient(dio);

  ///
  @singleton
  TokenClient get tokenClient => TokenClient(dio);
}
