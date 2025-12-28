import 'package:firebase_latihan/screen/screen%203.dart';
import 'package:firebase_latihan/viewmodel/prediction_view_model.dart';
import 'package:flutter/material.dart';

class MySplashScreen2 extends StatelessWidget {
  final PredictionViewModel viewModel; 

  const MySplashScreen2({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //TODO
          //1.BUAT IMAGE dalam container
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 100),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WEL",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[100]!,
                  ),
                ),
                Text(
                  "CO",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
                Text(
                  "ME",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[100]!,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Text(
              "Selamat datang orang kuning\n disini zona kuning",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: Colors.yellow),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red[100]!,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.green[100]!,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              child: SizedBox(
                height: 25,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MySplashScreen3(viewModel: viewModel,)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
