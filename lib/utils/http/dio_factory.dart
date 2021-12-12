import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ClientFactory {
  ClientFactory({
    required this.apiKey,
    required this.baseUrl,
    required this.apiPath,
  });

  final String apiKey;
  final String baseUrl;
  final String apiPath;

  Dio? _dio;
  Dio get dio {
    _dio = _dio ?? _generateDio();
    return _dio!;
  }

  Dio _generateDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: '$baseUrl/$apiPath',
        headers: {
          Headers.contentTypeHeader: 'application/x-www-form-urlencoded',
          if (apiKey.isNotEmpty) ...{
            'Authorization': 'auth $apiKey',
          }
        },
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          responseBody: false,
        ),
      );
    }
    return dio;
  }
}
