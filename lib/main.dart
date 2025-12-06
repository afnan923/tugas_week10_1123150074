import 'package:firebase_latihan/firebase_options.dart';
import 'package:firebase_latihan/screen/my_login.dart';
import 'package:flutter/material.dart';

 main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Latihan",
      debugShowCheckedModeBanner: false,
      home: MyLogin(),
    );
  }
}