import 'package:dio/dio.dart';

class Apiservice {
  final Dio dio = Dio();

  Future<dynamic> predict() async{
    try {
      final response = await dio.post(
        'https://bayardong.id/globalinstitute/api/predict',
        data: {
          "dob": "1995-08-12",
          "focus": "cinta",
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer SUPER_SECRET_TOKEN',
          },
        ),
      );

      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}