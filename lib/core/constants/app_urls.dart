import 'package:flutter/material.dart' show immutable;

/// [] yapısı: Compile Constant
/// Kullanımı: AppUrls.baseUrl

@immutable
final class AppUrls {
  ///
  const AppUrls._();

  ///
  static const String baseUrl = 'https://api.destekleme.com/';

  ///
  static const String register = 'api/users/register';

  ///
  static const String login = 'api/users/login';
}
