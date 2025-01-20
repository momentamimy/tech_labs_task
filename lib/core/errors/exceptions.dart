class ServerException implements Exception {}

class UnknownException implements Exception {}

class CustomException implements Exception {
  final String message;

  CustomException({required this.message});
}
