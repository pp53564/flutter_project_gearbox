import 'package:gearbox/auth/domain/entity/user.dart';
import 'package:gearbox/core/failure.dart';

sealed class AuthState {}

class AuthStateSuccess extends AuthState {
  final User user;

  AuthStateSuccess(this.user);
}

class AuthStateFailure extends AuthState {
  final Failure? failure;

  AuthStateFailure({this.failure});
}

class AuthStateLoading extends AuthState {}
