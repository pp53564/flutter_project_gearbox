import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

@JsonSerializable()
class AuthRequest {
  final String email;
  final String? username;
  final String password;
  final String? confirmPassword;

  AuthRequest({
    required this.email,
    this.username,
    required this.password,
    this.confirmPassword,
  });

  factory AuthRequest.fromJson(Map<String, dynamic> json) => _$AuthRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
