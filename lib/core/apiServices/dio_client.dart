import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart' as getx;
import 'package:marketnest/core/constants/ApiUrlConstants.dart';

const _defaultConnectTimeout = Duration(seconds: 60);
const _defaultReceiveTimeout = Duration(seconds: 60);

class DioClient {
  late Dio _dio, dio;
  final List<Interceptor>? interceptors;

  DioClient(dio, {this.interceptors}) {
    _dio = dio ?? Dio();
    final clientAdapter = dio.httpClientAdapter;
    if (clientAdapter is IOHttpClientAdapter) {
      clientAdapter.onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    _dio
      ..options.baseUrl = ApiUrlConstants.BASE_URL!
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..options.headers = {
      };

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) =>
            responseInterceptor(response, handler),
        onError: (DioError error, ErrorInterceptorHandler handler) =>
            errorInterceptor(error, handler),
      ),
    );
  }

  requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) {
    // logger.d(options.data);
    return handler.next(options);
  }

  responseInterceptor(Response response, ResponseInterceptorHandler handler) {
    // logger.d(response.data.toString());
    return handler.next(response);
  }

  errorInterceptor(DioError error, ErrorInterceptorHandler handler) {
    return handler.next(error);
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      final statusCode = response.statusCode;
      if (statusCode! >= 200 && statusCode < 299) {
        if (response.data.isEmpty) {
          return;
        } else {
          return response.data;
        }
      } else if (statusCode >= 400 && statusCode < 500) {
        // throw ClientErrorException();
      } else if (statusCode >= 500 && statusCode < 600) {
        // throw ServerErrorException();
      } else {
        // throw UnknownException();
      }
    } on SocketException {
      // throw ConnectionException();
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      final statusCode = response.statusCode;
      if (statusCode! >= 200 && statusCode < 299) {
        if (response.data.isEmpty) {
          return;
        } else {
          return response.data;
        }
      } else if (statusCode >= 400 && statusCode < 500) {
        // throw ClientErrorException();
      } else if (statusCode >= 500 && statusCode < 600) {
        // throw ServerErrorException();
      } else {
        // throw UnknownException();
      }
    } on SocketException catch (e) {
      // throw ConnectionException();
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data format");
    } on HttpException catch (_) {
      throw const HttpException("Unable to process the data http");
    } catch (e) {
      throw e;
    }
  }

// Future<dynamic> delete(
//     String uri, {
//       data,
//       Map<String, dynamic> queryParameters,
//       Options options,
//       CancelToken cancelToken,
//       ProgressCallback onSendProgress,
//       ProgressCallback onReceiveProgress,
//     }) async {
//   try {
//     Response response = await _dio.delete(
//       uri,
//       data: data,
//       queryParameters: queryParameters,
//       options: options,
//       cancelToken: cancelToken,
//
//     );
//
//     final statusCode = response.statusCode;
//
//
//
//     if (statusCode >= 200 && statusCode < 299) {
//       if (response.data.isEmpty) {
//         return;
//       }
//       else {
//         print("${response.data}");
//
//         return response.data;
//       }
//     }
//     else if (statusCode >= 400 && statusCode < 500) {
//       throw ClientErrorException();
//     }
//     else if (statusCode >= 500 && statusCode < 600) {
//       throw ServerErrorException();
//     }
//     else {
//       throw UnknownException();
//     }
//   } on SocketException {
//     throw ConnectionException();
//   } on FormatException catch (_) {
//     throw FormatException("Unable to process the data");
//   } on HttpException catch (_) {
//     throw HttpException("Unable to process the data");
//   } catch (e) {
//     throw e;
//   }
// }
}
