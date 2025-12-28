import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST');
    print('${options.method} ${options.uri}');
    print('Headers: ${options.headers}');
    print('Body: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE');
    print('${response.statusCode} ${response.requestOptions.uri}');
    print('Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('ERROR');
    print('URL: ${err.requestOptions.uri}');
    print('Message: ${err.message}');
    print('Response: ${err.response?.data}');
    handler.next(err);
  }
}