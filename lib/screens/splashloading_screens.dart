import 'package:flutter/material.dart';
import 'package:flutter_app/screens/formlogin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:splashscreen/splashscreen.dart';

import 'utama_screen.dart';

class SplashLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: checkSession(context),
        title: Text('Welcome In FlutterApp'),
        image: Image.asset("gambar/gambar1.png"),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.blue);
  }

  checkSession(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool sesi = preferences.getBool("sesi") ?? false;
    if (sesi == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UtamaScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FormLoginScreen()));
    }
  }
}
