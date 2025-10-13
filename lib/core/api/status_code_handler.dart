import 'package:obour/core/errors/failures.dart';

class StatusCodeHandler {
  static Failures handleStatusCode(int? statusCode, dynamic data) {
    final message = _extractMessage(data);

    switch (statusCode) {
      case 400:
        return ServerFailure("Bad Request: $message");

      case 401:
        return ServerFailure(message.isNotEmpty ? message : "Unauthorized request.");

      case 403:
        return ServerFailure("Forbidden: $message");

      case 404:
        return ServerFailure("Not Found: $message");

      case 422:
        return ServerFailure("Validation Error: $message");

      case 500:
        return ServerFailure("Internal Server Error: $message");

      case 502:
        return ServerFailure("Bad Gateway: $message");

      case 503:
        return ServerFailure("Service Unavailable: $message");

      default:
        return ServerFailure("Unexpected Error (code: $statusCode): $message");
    }
  }

  static String _extractMessage(dynamic data) {
    if (data == null) return "No details provided.";

    try {
      if (data is Map<String, dynamic>) {
        if (data.containsKey("message") && data["message"] is String) {
          return data["message"]!;
        }
        if (data.containsKey("error")) return data["error"].toString();
        if (data.containsKey("detail")) return data["detail"].toString();
      }
      return data.toString();
    } catch (e) {
      return "Failed to parse error message.";
    }
  }
}

