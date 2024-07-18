import '/data/data.dart';

abstract class ITokenRepository {
  Future<AuthResponse> registerUser(RegisterRequest request);
  Future<AuthResponse> loginUser(LoginRequest request);
}

class TokenRepository implements ITokenRepository {
  ///
  TokenRepository({required this.tokenClient});

  ///
  final TokenClient tokenClient;

  ///
  @override
  Future<AuthResponse> registerUser(RegisterRequest request) =>
      tokenClient.registerUser(request);

  ///
  @override
  Future<AuthResponse> loginUser(LoginRequest request) =>
      tokenClient.loginUser(request);
}
