import 'package:flutter/material.dart';
import 'package:flutter_app/screens/formlogin_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: FormLoginScreen(),
      title: Text('Welcome In FlutterApp'),
      image: Image.asset("gambar/gambar1.png"),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.blue
    );
  }
}