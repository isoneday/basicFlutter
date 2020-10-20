import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_makanan.dart';
import 'package:flutter_app/model/model_makanan.dart';
import 'package:flutter_app/screens/makanan_screen.dart';

class UIMinuman {
  Widget buildGridMinuman() {
    return GridView.builder(
        itemCount: DataMakanan.itemCount,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          ModelMakanan makanan = DataMakanan.getItemMakanan(index);
          return InkWell(
            splashColor: Colors.red,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailMakanan(
                            makanan: makanan,
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 7,
                shadowColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        child: Image.asset(
                          makanan.gambarMkn,
                          fit: BoxFit.fill,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        makanan.namaMkn,
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
