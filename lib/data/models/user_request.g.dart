// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      username: json['username'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      language: json['language'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'surname': instance.surname,
      'language': instance.language,
      'email': instance.email,
    };
