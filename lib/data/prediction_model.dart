import 'package:firebase_latihan/domain/prediction_entity.dart';

class PredictionModel extends PredictionEntity{
  PredictionModel({required super.zodiac, required super.prediction});

  factory PredictionModel.fromJson(Map<String, dynamic>json) {
    return PredictionModel(zodiac: json['zodiac'], prediction: json['prediction']);
  }
}