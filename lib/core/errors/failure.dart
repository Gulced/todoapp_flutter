import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  ///
  const Failure({
    required this.message,
    this.statusCode,
  });

  ///
  final String message;
  final String? statusCode;

  @override
  List<Object?> get props => [
        message,
        statusCode,
      ];
}

class LoginFailure extends Failure {
  const LoginFailure({required super.message, super.statusCode});
}

class AuthFailure extends Failure {
  const AuthFailure({required super.message, super.statusCode});
}
