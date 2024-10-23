import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String token;
  final String refreshToken;
  final String id;
  final String email;
  final String username;
  final String profileImageUrl;

  User({
    required this.token,
    required this.refreshToken,
    required this.id,
    required this.email,
    required this.username,
    required this.profileImageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
