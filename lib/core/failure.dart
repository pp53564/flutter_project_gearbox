sealed class Failure {}

class NetworkFailure extends Failure {
  NetworkFailure({final String? message});
}

class UserAlreadyExists extends Failure {
  UserAlreadyExists({final String? message});
}

class UserIsNotFound extends Failure {
  UserIsNotFound({final String? message});
}
