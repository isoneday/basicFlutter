import 'package:flutter/material.dart';
import 'package:flutter_app/screens/camera_screen.dart';
import 'package:flutter_app/screens/database_screen.dart';
import 'package:flutter_app/screens/makanan_screen.dart';
import 'package:flutter_app/screens/minuman_screen.dart';
import 'package:flutter_app/screens/portalberita_screen.dart';
import 'package:flutter_app/screens/quiz_screen.dart';

class UtamaScreen extends StatelessWidget {
  static String id = "utama";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Utama"),
        ),
        body: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  tampilanMenu("list makanan", "gambar/gambar1.png",
                      Colors.brown, context, MakananScreen.id),
                  tampilanMenu("grid minuman", "gambar/gambar2.png",
                      Colors.yellow, context, MinumanScreen.id)
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  tampilanMenu("Portal Berita", "gambar/gambar2.png",
                      Colors.yellow, context, PortalBeritaScreen.id),
                  tampilanMenu("Camera", "gambar/gambar1.png", Colors.brown,
                      context, CameraScreen.id)
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  tampilanMenu("database SQFlite", "gambar/gambar2.png",
                      Colors.yellow, context, DatabaseScreen.id),
                  tampilanMenu("ExpantionTile", "gambar/gambar1.png",
                      Colors.brown, context, QuizScreen.id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tampilanMenu(String title, String gambar, Color warna,
      BuildContext context, String halTujuan) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, halTujuan);
          },
          child: Container(
            color: warna,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  gambar,
                  width: 60,
                  height: 60,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
