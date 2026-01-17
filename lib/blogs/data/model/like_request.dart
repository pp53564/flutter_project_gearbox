import 'package:json_annotation/json_annotation.dart';

part 'like_request.g.dart';

@JsonSerializable()
class LikeRequest {
  final String blogId;
  final String userId;

  LikeRequest({required this.blogId, required this.userId});

  factory LikeRequest.fromJson(Map<String, dynamic> json) => _$LikeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LikeRequestToJson(this);
}
