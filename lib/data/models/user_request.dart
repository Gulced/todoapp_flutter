import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UserRequest with EquatableMixin {
  ///
  const UserRequest({
    this.username,
    this.name,
    this.surname,
    this.language,
    this.email,
  });

  ///
  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

  ///
  final String? username;
  final String? name;
  final String? surname;
  final String? language;
  final String? email;

  ///
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);

  ///
  @override
  List<Object?> get props => [
        username,
        name,
        surname,
        language,
        email,
      ];
}
