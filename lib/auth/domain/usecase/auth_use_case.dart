import 'package:dartz/dartz.dart';
import 'package:gearbox/auth/domain/entity/user.dart';
import 'package:gearbox/auth/domain/repository/user_repository.dart';
import 'package:gearbox/core/failure.dart';

class AuthUseCase {
  final UserRepository userRepository;

  AuthUseCase(this.userRepository);

  Future<Either<Failure, User>> signIn(String email, String password) async {
    return userRepository.signIn(email, password);
  }

  Future<Either<Failure, User>> signUp(
    String email,
    String username,
    String password,
    String confirmPassword,
  ) async {
    return userRepository.signUp(email, username, password, confirmPassword);
  }
}
