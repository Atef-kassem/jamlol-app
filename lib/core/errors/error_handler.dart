import 'package:dio/dio.dart';
import 'failures.dart';

class ErrorHandler {
  static Failures handleException(Object e, StackTrace stackTrace) {
    print('[ErrorHandler] Exception: $e');
    print('[ErrorHandler] StackTrace: $stackTrace');

    if (e is DioException) {
      final errorData = e.response?.data;
      final message = errorData is Map
          ? errorData['message'] ?? 'Network error occurred.'
          : 'Network error occurred.';
      return ServerFailure(message);
    }

    return ServerFailure("Unexpected exception: ${e.toString()}");
  }
}
