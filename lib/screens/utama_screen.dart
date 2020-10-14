import 'package:flutter/material.dart';

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
                tampilanMenu(
                    "list makanan", "gambar/gambar1.png", Colors.brown),
                tampilanMenu("list buah", "gambar/gambar2.png", Colors.yellow)
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                tampilanMenu(
                    "list minuman", "gambar/gambar2.png", Colors.yellow),
                tampilanMenu("list minuman", "gambar/gambar1.png", Colors.brown)
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                tampilanMenu(
                    "list minuman", "gambar/gambar2.png", Colors.yellow),
                tampilanMenu("list minuman", "gambar/gambar1.png", Colors.brown)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tampilanMenu(String title, String gambar, Color warna) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GestureDetector(
          onTap: () {
            print("tap 1");
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
