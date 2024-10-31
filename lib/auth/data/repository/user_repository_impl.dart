import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gearbox/auth/data/api/auth_api.dart';
import 'package:gearbox/auth/data/model/auth_request.dart';
import 'package:gearbox/auth/domain/entity/user.dart';
import 'package:gearbox/auth/domain/repository/user_repository.dart';
import 'package:gearbox/core/failure.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthApi _authApi;

  UserRepositoryImpl(this._authApi);

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    try {
      final request = AuthRequest(email: email, password: password);
      final response = await _authApi.signIn(request);
      return Right(response);
    } on DioException catch (error) {
      return error.response?.data['message'] == "User is not found."
          ? Left(UserIsNotFound())
          : Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signUp(
    String email,
    String username,
    String password,
    String confirmPassword,
  ) async {
    try {
      final request = AuthRequest(
        email: email,
        username: username,
        password: password,
        confirmPassword: confirmPassword,
      );
      final response = await _authApi.signUp(request);
      return Right(response);
    } on DioException catch (error) {
      return error.response?.data['message'] == "User already exists."
          ? Left(UserAlreadyExists())
          : Left(NetworkFailure());
    }
  }
}
