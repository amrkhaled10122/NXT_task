import 'package:dio/dio.dart';

/// Represents the response received from an API request.
class ApiResponse {
  /// The status code of the response.
  final int? statusCode;

  /// The message associated with the response.
  String? message;

  /// List of errors, if any.
  List? errors;

  /// Constructs an instance of [ApiResponse].
  ApiResponse({
    this.statusCode,
    this.message,
    this.errors,
  });

  /// Constructs an instance of [ApiResponse] from a Dio [Response].
  factory ApiResponse.fromResponse(Response response) {
    final int code = response.statusCode!;
    final List errors = [];
    String message = response.statusMessage!;

    // Handling different status codes
    switch (code) {
      case 0:
      case 200:
      case 201:
        // For success codes, retain the original message
        message = message;
        break;
      default:
        // For other codes, treat the message as an error
        errors.add(message);
        break;
    }

    return ApiResponse(
      statusCode: code,
      message: message,
      errors: errors,
    );
  }

  /// Checks if there are no errors in the response.
  bool get allGood => errors!.isEmpty;

  /// Checks if there are any errors in the response.
  bool hasError() => errors!.isNotEmpty;
}
