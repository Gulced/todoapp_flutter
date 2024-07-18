import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse with EquatableMixin {
  ///
  const AuthResponse({
    this.success,
    this.message,
    this.data,
  });

  ///
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  ///
  final bool? success;
  final String? message;
  final Data? data;

  ///
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  ///
  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

@JsonSerializable()
class Data with EquatableMixin {
  ///
  const Data({
    this.id,
    this.username,
    this.name,
    this.surname,
    this.language,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  ///
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  ///
  final String? id;
  final String? username;
  final String? name;
  final String? surname;
  final String? language;
  final String? email;
  final String? createdAt;
  final String? updatedAt;

  ///
  Map<String, dynamic> toJson() => _$DataToJson(this);

  ///
  @override
  List<Object?> get props => [
        id,
        username,
        name,
        surname,
        language,
        email,
        createdAt,
        updatedAt,
      ];
}
