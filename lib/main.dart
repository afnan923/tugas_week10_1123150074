import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_latihan/screen/screen1.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

import 'core/dio_client.dart';
import 'data/prediction_api_service.dart';
import 'domain/prediction_usecase.dart';
import 'viewmodel/prediction_view_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final dio = DioClient().create();
  final api = PredictionApiService(dio);
  final useCase = PredictionUsecase(api);
  final viewModel = PredictionViewModel(useCase);

  runApp(MyApp(viewModel: viewModel));
}

class MyApp extends StatelessWidget {
  final PredictionViewModel viewModel;

  const MyApp({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Latihan",
      debugShowCheckedModeBanner: false,
      home: MySplashScreen(viewModel: viewModel),
    );
  }
}
