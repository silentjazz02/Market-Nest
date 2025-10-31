import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'BaseApi.dart';
import 'ExceptionHandler.dart';

class NetworkApi extends BaseApi {
  // UserAuthModel user = const UserAuthModel();

  late final Dio _dio;

  NetworkApi(this._dio);

  @override
  Future<Response> get(
    String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  ) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: await buildQueryParameters(queryParameters),
        options: Options(headers: await _buildHeaders(headers ?? <String, dynamic>{})),
      );
      return _handleResponse(response);
    } on Exception catch (e, stack) {
      await _handleAuthenticationError(e);
      throw ExceptionHandler.handleNetworkException(e, stack);
    }
  }

  @override
  Future<Response> post(
    String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  ) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: await buildQueryParameters(queryParameters),
        options: Options(headers: await _buildHeaders(headers ?? <String, dynamic>{})),
      );
      return _handleResponse(response);
    } on Exception catch (e, stack) {
      await _handleAuthenticationError(e);
      throw ExceptionHandler.handleNetworkException(e, stack);
    }
  }

  @override
  Future<Response> put(
    String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  ) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: await buildQueryParameters(queryParameters),
        options: Options(headers: await _buildHeaders(headers ?? <String, dynamic>{})),
      );
      return _handleResponse(response);
    } on Exception catch (e, stack) {
      await _handleAuthenticationError(e);
      throw ExceptionHandler.handleNetworkException(e, stack);
    }
  }

  @override
  Future<Response> delete(
    String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  ) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: await buildQueryParameters(queryParameters),
        options: Options(headers: await _buildHeaders(headers ?? <String, dynamic>{})),
      );
      return _handleResponse(response);
    } on Exception catch (e, stack) {
      await _handleAuthenticationError(e);
      throw ExceptionHandler.handleNetworkException(e, stack);
    }
  }

  Future<void> _handleAuthenticationError(Exception e) async {
    if (e is DioException && e.response?.statusCode == 403) {
      debugPrint('🔴 403 Forbidden Error - Triggering automatic logout');
    }
  }

  Future<Map<String, dynamic>> _buildHeaders(Map<String, dynamic> headers) async {
    final Map<String, dynamic> updatedHeaders = {};

    updatedHeaders.addAll(headers);

    return updatedHeaders;
  }



  Response _handleResponse(Response? response) {
    if (response == null) {
      throw Exception('No response received from the server');
    }

    final statusCode = response.statusCode;
    final responseData = response.data;

    if (statusCode == null) {
      throw Exception('Response status code is null');
    }

    if (statusCode >= 200 && statusCode < 300 && responseData != null && responseData['success'] == true) {
      return response;
    } else {
      throw Exception(responseData['message'] ?? 'Some error occured during fetching data');
    }
  }
}

Future<Map<String, dynamic>> buildQueryParameters(Map<String, dynamic>? queryParameters) async {
  final Map<String, dynamic> updatedQueryParameters = {};

  updatedQueryParameters.addAll(queryParameters ?? {});

  return updatedQueryParameters;
}
