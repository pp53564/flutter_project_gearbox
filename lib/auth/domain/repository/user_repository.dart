import 'package:dartz/dartz.dart';
import 'package:gearbox/auth/domain/entity/user.dart';
import 'package:gearbox/core/failure.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User>> signIn(final String email, final String password);

  Future<Either<Failure, User>> signUp(
    final String email,
    final String username,
    final String password,
  );
}
