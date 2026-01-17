// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeRequest _$LikeRequestFromJson(Map<String, dynamic> json) => LikeRequest(
      blogId: json['blogId'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$LikeRequestToJson(LikeRequest instance) =>
    <String, dynamic>{
      'blogId': instance.blogId,
      'userId': instance.userId,
    };
