import 'package:flutter/material.dart';
import 'package:flutter_app/screens/makanan_screen.dart';
import 'package:flutter_app/screens/minuman_screen.dart';
import 'package:flutter_app/screens/portalberita_screen.dart';

class UtamaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Utama"),
      ),
      body: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                tampilanMenu("list makanan", "gambar/gambar1.png", Colors.brown,
                    context, MakananScreen()),
                tampilanMenu("grid minuman", "gambar/gambar2.png",
                    Colors.yellow, context, MinumanScreen())
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                tampilanMenu("Portal Berita", "gambar/gambar2.png",
                    Colors.yellow, context, PortalBeritaScreen()),
                tampilanMenu("grid minuman", "gambar/gambar1.png", Colors.brown,
                    context, MinumanScreen())
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                tampilanMenu("list makanan", "gambar/gambar2.png",
                    Colors.yellow, context, MakananScreen()),
                tampilanMenu("grid minuman", "gambar/gambar1.png", Colors.brown,
                    context, MinumanScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tampilanMenu(String title, String gambar, Color warna,
      BuildContext context, Widget halTujuan) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => halTujuan));
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
