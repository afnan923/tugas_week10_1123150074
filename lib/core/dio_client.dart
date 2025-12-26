import 'package:dio/dio.dart';

class DioClient {
  Dio create(){
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.bayardong.id/globalinstitute/api',
connectTimeout: const Duration(milliseconds: 5000),
receiveTimeout: const Duration(milliseconds: 30000),
headers: {
'Content-Type': 'application/json',
'Authotization': 'Bearer AMBER_JACK_TOKEN'
  },
      ),
    );
    dio.interceptors.add(LogInterceptor());
    return dio;
  }
}