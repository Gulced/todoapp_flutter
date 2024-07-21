import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '/core/core.dart';
import '/data/data.dart';
import '/domain/domain.dart';

abstract class ITokenRepository {
  Future<Either<LoginFailure, AuthResponse>> registerUser({
    required RegisterRequest request,
  });
  Future<Either<LoginFailure, AuthResponse>> loginUser({
    required LoginRequest request,
  });

  Future<Either<LoginFailure, Unit>> logout();
}

@Singleton(as: ITokenRepository)
class TokenRepository implements ITokenRepository {
  ///
  TokenRepository({
    required this.tokenClient,
    required this.storageRepository,
  });

  ///
  final TokenClient tokenClient;

  ///
  final IStorageRepository storageRepository;

  ///
  @override
  Future<Either<LoginFailure, AuthResponse>> loginUser({
    required LoginRequest request,
  }) async {
    /// [Giriş Yap]
    try {
      final response = await tokenClient.loginUser(request);

      /// Kullanıcı [Girişi Başarısız] ise
      if (response.success == null || !response.success!) {
        return const Left(
          LoginFailure(
            message: 'Giriş Başarısız',
          ),
        );
      }

      /// Save tokens to local storage
      await Future.wait(<Future<void>>[
        /// Token'ı Cache'le
        storageRepository.setToken(response.data?.token),

        /// Giriş Yaptığını Cache'le
        storageRepository.setIsLogged(isLogged: true),
      ]);

      /// [Giriş Başarılı ise]
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

      /// Save tokens to local storage
      await Future.wait(<Future<void>>[
        /// Token'ı Cache'le
        storageRepository.setToken(response.data?.token),

        /// Giriş Yaptığını Cache'le
        storageRepository.setIsLogged(isLogged: true),
      ]);

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

  @override
  Future<Either<LoginFailure, Unit>> logout() async {
    try {
      ///
      await Future<void>.delayed(const Duration(milliseconds: 500));

      /// Clear auth tokens from the local storage
      await Future.wait(<Future<void>>[
        /// Token'ı Cache'ten temizle
        storageRepository.setToken(null),

        /// Çıkış Yaptığını Cache'le
        storageRepository.setIsLogged(isLogged: false),
      ]);

      /// Alternatif Kullanım:
      /// return right(unit);
      return const Right<LoginFailure, Unit>(unit);
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
