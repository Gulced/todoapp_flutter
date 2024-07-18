import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_data.dart';

part 'users.g.dart';

@JsonSerializable()
class Users with EquatableMixin {
  ///
  const Users({
    this.success,
    this.message,
    this.data,
  });

  ///
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  ///
  final bool? success;
  final String? message;
  final List<UserData>? data;

  ///
  Map<String, dynamic> toJson() => _$UsersToJson(this);

  ///
  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
