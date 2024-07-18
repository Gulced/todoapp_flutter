import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData with EquatableMixin {
  ///
  const UserData({
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
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

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
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  ///
  @override
  List<Object?> get props =>
      [id, username, name, surname, language, email, createdAt, updatedAt];
}
