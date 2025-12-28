import 'package:firebase_latihan/data/prediction_api_service.dart';
import 'package:firebase_latihan/data/prediction_model.dart';
import 'package:firebase_latihan/domain/prediction_request.dart';

class PredictionUsecase {
  final PredictionApiService predictionApiService;

  PredictionUsecase(this.predictionApiService);

  Future<PredictionModel> execute(PredictionRequest request) async {
    // Business validation
    if (request.dob.isAfter(DateTime.now())) {
      throw Exception('DOB cannot be in the future');
    }

    // Application flow logic
    try {
      return await predictionApiService.predict(request);
    } catch (e) {
      //Business decision
      return PredictionModel(zodiac: 'Unknown', prediction: 'Prediction unavailable at the moment');
    }
  }
}