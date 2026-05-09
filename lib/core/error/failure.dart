abstract class Failure {
  final String message;

  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({String message = 'No internet connection'})
    : super(message);
}

class ServerFailure extends Failure {
  const ServerFailure({String message = "Server error occurred"})
    : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure({String message = "Local storage error"}) : super(message);
}

class AuthFailure extends Failure {
  const AuthFailure({String message = "Authentication failed"})
    : super(message);
}

class CancelledFailure extends Failure {
  const CancelledFailure([super.message = 'Cancelled']);
}

class UnknownFailure extends Failure {
  const UnknownFailure({String message = "Something went wrong"})
    : super(message);
}
