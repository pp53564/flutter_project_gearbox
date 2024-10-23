sealed class Failure {}

class InvalidCredentialsFailure extends Failure {
  InvalidCredentialsFailure({final String? message});
}

class NetworkFailure extends Failure {
  NetworkFailure({final String? message});
}
