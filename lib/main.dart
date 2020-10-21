import 'package:flutter/material.dart';
import 'package:flutter_app/screens/camera_screen.dart';
import 'package:flutter_app/screens/formlogin_screen.dart';
import 'package:flutter_app/screens/makanan_screen.dart';
import 'package:flutter_app/screens/minuman_screen.dart';
import 'package:flutter_app/screens/portalberita_screen.dart';
import 'package:flutter_app/screens/splashloading_screens.dart';
import 'package:flutter_app/screens/utama_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: SplashLoadingScreen()
      initialRoute: SplashLoadingScreen.id,
      routes: {
        SplashLoadingScreen.id: (context) => SplashLoadingScreen(),
        CameraScreen.id: (context) => CameraScreen(),
        FormLoginScreen.id: (context) => FormLoginScreen(),
        MakananScreen.id: (context) => MakananScreen(),
        DetailMakanan.id: (context) => DetailMakanan(),
        WebMakanan.id: (context) => WebMakanan(),
        MinumanScreen.id: (context) => MinumanScreen(),
        PortalBeritaScreen.id: (context) => PortalBeritaScreen(),
        DetailBerita.id: (context) => DetailBerita(),
        WebBerita.id: (context) => WebBerita(),
        UtamaScreen.id: (context) => UtamaScreen(),
      },
    );
  }
}
