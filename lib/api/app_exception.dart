class AppException implements Exception {
  String errorMessage;
  AppException({required this.errorMessage});
}
