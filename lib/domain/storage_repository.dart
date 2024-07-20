import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/core.dart';

abstract class IStorageRepository {
  Future<String?> getToken();
  Future<void> setToken(String? value);

  /// Kullanıcı oturum açıp-açmadığını kontrol
  Future<bool?> getIsLogged();
  Future<void> setIsLogged({bool? isLogged});
}

@Injectable(as: IStorageRepository)
class StorageRepository implements IStorageRepository {
  ///
  const StorageRepository({
    required this.securedStorage,
    required this.unsecuredStorage,
  });

  ///
  final FlutterSecureStorage securedStorage;
  final SharedPreferences unsecuredStorage;

  @override
  Future<String?> getToken() => securedStorage.read(
        key: AppStorage.token.key,
      );

  @override
  Future<void> setToken(String? value) => securedStorage.write(
        key: AppStorage.token.key,
        value: value,
      );

  @override
  Future<bool?> getIsLogged() async => unsecuredStorage.getBool(
        AppStorage.isLoggedIn.key,
      );

  @override
  Future<void> setIsLogged({bool? isLogged}) async => unsecuredStorage.setBool(
        AppStorage.isLoggedIn.key,
        isLogged ?? false,
      );
}
