import 'package:firebase_latihan/domain/prediction_entity.dart';
import 'package:firebase_latihan/domain/prediction_request.dart';
import 'package:firebase_latihan/domain/prediction_usecase.dart';
import 'package:flutter/foundation.dart';




class PredictionViewModel {
  final PredictionUsecase useCase;
  final ValueNotifier<PredictionState> state = ValueNotifier(PredictionInitial());

  PredictionViewModel(this.useCase);

  Future<void> submit(PredictionRequest request) async {
    state.value = PredictionLoading();
    try {
      final result = await useCase.execute(request);
      state.value = PredictionSuccess(result);
    } catch (e) {
      state.value = PredictionError(e.toString());
    }
  }
}

sealed class PredictionState {}

class PredictionInitial extends PredictionState {}

class PredictionLoading extends PredictionState {}

class PredictionSuccess extends PredictionState {
  final PredictionEntity result;
  PredictionSuccess(this.result);
}

class PredictionError extends PredictionState {
  final String message;
  PredictionError(this.message);
}