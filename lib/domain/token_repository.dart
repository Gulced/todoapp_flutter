import 'package:injectable/injectable.dart';

import '/data/data.dart';

abstract class ITokenRepository {
  Future<AuthResponse> registerUser({required RegisterRequest request});
  Future<AuthResponse> loginUser({required LoginRequest request});
}

@LazySingleton(as: ITokenRepository)
class TokenRepository implements ITokenRepository {
  ///
  TokenRepository({required this.tokenClient});

  ///
  final TokenClient tokenClient;

  ///
  @override
  Future<AuthResponse> registerUser({required RegisterRequest request}) =>
      tokenClient.registerUser(request);

  ///
  @override
  Future<AuthResponse> loginUser({required LoginRequest request}) =>
      tokenClient.loginUser(request);
}
