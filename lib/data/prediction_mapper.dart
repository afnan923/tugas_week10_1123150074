import 'package:firebase_latihan/data/prediction_request_dio.dart';
import 'package:firebase_latihan/domain/prediction_request.dart';

class PredictionMapper {
  static PredictionRequestDio toDio(PredictionRequest request) {
    return PredictionRequestDio(
      dob: request.dob.toIso8601String().split('T').first,
      focus: request.focus.name,
    );
  }
}