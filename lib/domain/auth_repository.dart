import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '/core/core.dart';
import '/data/data.dart';
import '/domain/domain.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, AuthResponse>> logoutUser({
    required LogoutRequest request,
  });
  Future<Either<AuthFailure, AuthResponse>> removeUser({required int id});
  Future<Either<AuthFailure, User>> updateUser({
    required UserRequest request,
    required int id,
  });
  Future<Either<AuthFailure, User>> getUserById({required int id});
  Future<Either<AuthFailure, Users>> getAllUsers();
  Future<Either<AuthFailure, Todos>> getAllTodos();
  Future<Either<AuthFailure, Todo>> getTodoById({required int id});
  Future<Either<AuthFailure, Todo>> updateTodo({
    required TodoRequest request,
    required int id,
  });
  Future<Either<AuthFailure, Todo>> deleteTodo({required int id});
  Future<Either<AuthFailure, Todo>> insertTodo({required TodoRequest request});
}

@Singleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  ///
  AuthRepository({
    required this.authClient,
    required this.storageRepository,
  });

  ///
  final AuthClient authClient;

  ///
  final IStorageRepository storageRepository;

  /// [1 Çıkış Yap]
  @override
  Future<Either<AuthFailure, AuthResponse>> logoutUser({
    required LogoutRequest request,
  }) async {
    try {
      final response = await authClient.logoutUser(request);

      /// Kullanıcı [Çıkışı Başarısız] ise
      if (response.success == null || !response.success!) {
        return const Left(
          AuthFailure(
            message: 'Çıkış Başarısız',
          ),
        );
      }

      /// Clear auth tokens from the local storage
      await Future.wait(<Future<void>>[
        storageRepository.setToken(null),
        storageRepository.setIsLogged(isLogged: false),
      ]);

      /// [Çıkış Başarılı ise]
      return Right(response);

      ///
    } catch (e) {
      ///
      return Left(
        AuthFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [2 Kullanıcı Sil]
  @override
  Future<Either<AuthFailure, AuthResponse>> removeUser({
    required int id,
  }) async {
    ///
    try {
      final response = await authClient.removeUser(id);

      if (response.success == null || !response.success!) {
        return const Left(
          AuthFailure(
            message: 'Silme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        AuthFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [3 Kullanıcı Güncelleme]
  @override
  Future<Either<AuthFailure, User>> updateUser({
    required UserRequest request,
    required int id,
  }) async {
    ///
    try {
      final response = await authClient.updateUser(request, id);

      if (response.success == null || !response.success!) {
        return const Left(
          AuthFailure(
            message: 'Güncelleme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        AuthFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [4 ID'ye Göre Kullanıcı Bilgilerini Getir]
  @override
  Future<Either<AuthFailure, User>> getUserById({required int id}) async {
    try {
      final response = await authClient.getUserById(id);

      if (response.success == null || !response.success!) {
        return const Left(
          AuthFailure(
            message: 'Kullanıcı Bilgisi Getirme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        AuthFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [5 Tüm Kullanıcı Bilgilerini Getir]
  @override
  Future<Either<AuthFailure, Users>> getAllUsers() async {
    try {
      final response = await authClient.getAllUsers();

      if (response.success == null || !response.success!) {
        return const Left(
          AuthFailure(
            message: 'Tüm Kullanıcı Bilgilerini Getirme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        AuthFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [6 Tüm Todoları Getir]
  @override
  Future<Either<AuthFailure, Todos>> getAllTodos() async {
    try {
      final response = await authClient.getAllTodos();

      if (response.success == null || !response.success!) {
        return const Left(
          AuthFailure(
            message: 'Tüm Todoları Getirme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        AuthFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [7 ID'ye Göre Getir]
  @override
  Future<Either<AuthFailure, Todo>> getTodoById({required int id}) async {
    try {
      final response = await authClient.getTodoById(id);

      if (response.success == null || !response.success!) {
        return const Left(
          AuthFailure(
            message: 'Todo Getirme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        AuthFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [8 Todoyu Güncelle]
  @override
  Future<Either<AuthFailure, Todo>> updateTodo({
    required TodoRequest request,
    required int id,
  }) async {
    try {
      final response = await authClient.updateTodo(request, id);

      if (response.success == null || !response.success!) {
        return const Left(
          AuthFailure(
            message: 'Todo Güncelleme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        AuthFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [9 Todoyu Sil]
  @override
  Future<Either<AuthFailure, Todo>> deleteTodo({required int id}) async {
    try {
      final response = await authClient.deleteTodo(id);

      if (response.success == null || !response.success!) {
        return const Left(
          AuthFailure(
            message: 'Todo Silme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        AuthFailure(
          message: '$e',
        ),
      );
    }
  }

  /// [10 Yeni Ekle]
  @override
  Future<Either<AuthFailure, Todo>> insertTodo({
    required TodoRequest request,
  }) async {
    try {
      final response = await authClient.insertTodo(request);

      if (response.success == null || !response.success!) {
        return const Left(
          AuthFailure(
            message: 'Todo Ekleme Başarısız',
          ),
        );
      }
      return Right(response);

      ///
    } catch (e) {
      return Left(
        AuthFailure(
          message: '$e',
        ),
      );
    }
  }
}
