import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_makanan.dart';
import 'package:flutter_app/ui/ui_makanan.dart';

class MakananScreen extends StatelessWidget {
  UiMakanan uiMakanan = UiMakanan();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Makanan"),
        ),
        body: uiMakanan.buildListView());
  }
}

class DetailMakanan extends StatelessWidget {
  UiMakanan uiMakanan = UiMakanan();
  ModelMakanan makanan;
  
  // DetailMakanan(this.makanan);
  DetailMakanan({Key key,@required this.makanan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Makanan"),
      actions: [
        IconButton(icon: Icon(Icons.open_in_browser), onPressed: (){

        })
      ],),
      body: uiMakanan.buildDetailList(makanan),
    );
  }
}

class WebMakanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
