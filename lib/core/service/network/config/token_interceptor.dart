import 'package:dio/dio.dart';

import 'api_endpoints.dart';

/// Interceptor to add authorization token to the request headers.
class TokenInterceptor extends InterceptorsWrapper {
  TokenInterceptor();

  /// Adds authorization token to the request headers before sending the request.
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Adding authorization token to the request headers
    options.headers['Authorization'] = "Bearer ${ApiEndpoints.fixedToken}";

    return super.onRequest(options, handler);
  }

  /// Handles error responses, such as unauthorized (401) errors.
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Handling unauthorized (401) errors if needed
    if (err.response!.statusCode == 401) {
      // Handle unauthorized error here
    }

    super.onError(err, handler);
  }
}
