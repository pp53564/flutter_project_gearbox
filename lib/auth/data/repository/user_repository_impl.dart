import 'package:dartz/dartz.dart';
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
    } catch (error) {
      print(error);
      return error.toString() == "User not found"
          ? Left(InvalidCredentialsFailure())
          : Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signUp(String email, String username, String password) async {
    try {
      final request = AuthRequest(email: email, username: username, password: password);
      final response = await _authApi.signUp(request);
      return Right(response);
    } catch (error) {
      return error.toString() == "User not found"
          ? Left(InvalidCredentialsFailure())
          : Left(NetworkFailure());
    }
  }
}
