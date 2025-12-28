import 'package:dio/dio.dart';
import 'package:firebase_latihan/data/prediction_mapper.dart';
import 'package:firebase_latihan/data/prediction_model.dart';
import 'package:firebase_latihan/domain/prediction_request.dart';


class PredictionApiService {
  // Prediction API service implementation
  final Dio dio;
  PredictionApiService(this.dio);

  Future<PredictionModel> predict(PredictionRequest request) async {
    final dto = PredictionMapper.toDio(request);

    final response = await dio.post('https://bayardong.id/globalinstitute/api/predict', data: dto.toJson());

    if (response.statusCode == 200) {
      return PredictionModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load prediction');
    }
  }
}