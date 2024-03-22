import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_endpoints.dart';
import 'token_interceptor.dart';

/// A singleton class to manage API requests using Dio.
class ApiService {
  ApiService._internal();

  /// Instance of Dio for making API requests.
  static final Dio _dio = Dio();

  /// Initialize Dio with base options and interceptors.
  void initializeDio() {
    _dio.options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      followRedirects: false,
      contentType: 'application/json; charset=utf-8',
      validateStatus: (int? status) => (status ?? 0) < 500,
    );

    // Add TokenInterceptor to handle authentication token
    _dio.interceptors.add(TokenInterceptor());

    // Add PrettyDioLogger for logging requests and responses in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  /// Singleton instance of ApiService.
  static final ApiService instance = ApiService._internal();

  /// Fetch data from the API using a GET request.
  Future<Response> getData({required String urlPath}) async {
    try {
      return await _dio.get(urlPath);
    } catch (error) {
      _handleError(error);
    }
    // Throw statement added to ensure non-null return value
    throw Exception('Unexpected Error occurred while fetching data');
  }

  /// Send data to the API using a POST request.
  Future<Response> postData({required String url, required FormData data}) async {
    try {
      return await _dio.post(url, data: data);
    } catch (error) {
      _handleError(error);
    }
    // Throw statement added to ensure non-null return value
    throw Exception('Unexpected Error occurred while sending data');
  }

  /// Update data in the API using a PUT request.
  Future<Response> putData({required String url, required FormData data}) async {
    try {
      return await _dio.put(url, data: data);
    } catch (error) {
      _handleError(error);
    }
    // Throw statement added to ensure non-null return value
    throw Exception('Unexpected Error occurred while updating data');
  }

  /// Delete data in the API using a DELETE request.
  Future<Response> deleteData({required String url}) async {
    try {
      return await _dio.delete(url);
    } catch (error) {
      _handleError(error);
    }
    // Throw statement added to ensure non-null return value
    throw Exception('Unexpected Error occurred while deleting data');
  }

  /// Handle error during API request.
  void _handleError(dynamic error) {
    if (error is DioError) {
      // Handle Dio errors
      debugPrint("Dio error: ${error.response?.data}");
      throw Exception('Error: ${error.error}');
    } else {
      // Handle other unexpected errors
      debugPrint("Unexpected error: $error");
      throw Exception('Unexpected Error');
    }
  }
}
