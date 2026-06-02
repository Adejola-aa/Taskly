class AppException implements Exception {
  final String message;
  final String? code;

  const AppException({required this.message, this.code});

  @override
  String toString() =>
      'AppException(type: $runtimeType, message: $message, code: $code)';
}

class ServerException extends AppException {
  const ServerException({required super.message, super.code});
}

class NetworkException extends AppException {
  const NetworkException({required super.message, super.code});
}

class CacheException extends AppException {
  const CacheException({required super.message, super.code});
}

class AuthException extends AppException {
  const AuthException({required super.message, super.code});
}

class AuthCanceledException extends AppException {
  const AuthCanceledException()
    : super(message: 'Authentication canceled by user');
}
