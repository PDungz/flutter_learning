import 'package:dio/dio.dart';

import '../services/logger_service.dart';
import '../utils/dot_env_util.dart';

class DioClient {
  late Dio dio;

  final baseUrl = DotEnvUtil.hostApi + DotEnvUtil.apiVesion;

  DioClient() {
    initDio();
  }

  void initDio() {
    dio = Dio();
    final apiKey = DotEnvUtil.apiKey;
    dio.options = BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'application/json'
        });
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // options.queryParameters.addAll({'api_key': DotEnvUtil.apiKey});
      printI(
          "[REQUEST] Api: ${options.path} | Method: ${options.method} | \nQuery parameter: ${options.queryParameters} | Body request data: ${options.data}");
      return handler.next(options);
    }, onResponse: (response, handler) {
      final statusCode = response.statusCode;
      final data = response.data;
      final requestOptions = response.requestOptions;
      printS(
        "[RESPONSE][Code: $statusCode] Api: ${requestOptions.path} | Method: ${requestOptions.method} | Query parameter: ${requestOptions.queryParameters} | Body request data: ${requestOptions.data} | Data response: $data",
      );

      return handler.next(response);
    }));
  }
}
