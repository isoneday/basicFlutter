import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_makanan.dart';
import 'package:flutter_app/model/model_makanan.dart';
import 'package:flutter_app/screens/makanan_screen.dart';

class UiMakanan {
  Widget buildListView() {
    return ListView.builder(
        itemCount: DataMakanan.itemCount,
        itemBuilder: (context, index) {
          ModelMakanan makanan = DataMakanan.getItemMakanan(index);
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailMakanan(makanan: makanan,)));
            },
            //row kita kasi jarak dengaan padding
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 7,
                shadowColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            makanan.namaMkn,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(makanan.gambarMkn),
                            radius: 27,
                          )
                        ],
                      ),
                      // Divider(
                      //   color: Colors.red,
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
