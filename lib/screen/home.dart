// import 'package:firebase_latihan/core/dio_client.dart';
// import 'package:firebase_latihan/data/prediction_api_service.dart';
// import 'package:firebase_latihan/domain/prediction_usecase.dart';
// import 'package:firebase_latihan/viewmodel/prediction_form_page.dart';
// import 'package:firebase_latihan/viewmodel/prediction_view_model.dart';
// import 'package:flutter/material.dart';

// void main() {
//   final dioClient = DioClient();
//   final dio = dioClient.create();
//   final api = PredictionApiService(dio);
//   final useCase = PredictionUsecase(api);
//   final viewModel = PredictionViewModel(useCase);

//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: PredictionFormPage(viewModel: viewModel),
//     ),
//   );
// }
