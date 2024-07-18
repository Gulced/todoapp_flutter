import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '/core/core.dart';
import '/data/data.dart';

abstract class ITokenRepository {
  Future<Either<LoginFailure, AuthResponse>> registerUser({
    required RegisterRequest request,
  });
  Future<Either<LoginFailure, AuthResponse>> loginUser({
    required LoginRequest request,
  });
}

@LazySingleton(as: ITokenRepository)
class TokenRepository implements ITokenRepository {
  ///
  TokenRepository({required this.tokenClient});

  ///
  final TokenClient tokenClient;

  ///
  @override
  Future<Either<LoginFailure, AuthResponse>> loginUser({
    required LoginRequest request,
  }) async {
    /// [Giriş Yap]
    try {
      final response = await tokenClient.loginUser(request);

      /// Kullanıcı girişi [Başarısız] ise
      if (!response.success!) {
        ///
        return const Left(
          LoginFailure(
            message: 'Giriş Başarısız',
          ),
        );
      }

      /// [Başarılı ise]
      return Right(response);

      ///
    } catch (e) {
      ///
      return Left(
        LoginFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [Kaydol Metodu]
  @override
  Future<Either<LoginFailure, AuthResponse>> registerUser({
    required RegisterRequest request,
  }) async {
    try {
      ///
      final response = await tokenClient.registerUser(request);

      /// [Başarısız ise]
      if (!response.success!) {
        return const Left(
          LoginFailure(
            message: 'Kayıt İşlemi Başarısız',
          ),
        );
      }

      ///
      return Right(response);
    } catch (e) {
      ///
      return Left(
        LoginFailure(
          message: '$e',
        ),
      );
    }
  }
}
