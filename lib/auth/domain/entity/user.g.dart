// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'profileImageUrl': instance.profileImageUrl,
    };
