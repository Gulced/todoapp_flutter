import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_data.dart';

part 'user.g.dart';

@JsonSerializable()
class User with EquatableMixin {
  ///
  const User({
    this.success,
    this.message,
    this.data,
  });

  ///
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  ///
  final bool? success;
  final String? message;
  final UserData? data;

  ///
  Map<String, dynamic> toJson() => _$UserToJson(this);

  ///
  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
