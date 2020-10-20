import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_makanan.dart';
import 'package:flutter_app/ui/ui_makanan.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MakananScreen extends StatelessWidget {
  final UiMakanan uiMakanan = UiMakanan();

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
  final UiMakanan uiMakanan = UiMakanan();
  final ModelMakanan makanan;

  // DetailMakanan(this.makanan);
  DetailMakanan({Key key, @required this.makanan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Makanan"),
        actions: [
          IconButton(
              icon: Icon(Icons.open_in_browser),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebMakanan(makanan: makanan)));
              })
        ],
      ),
      body: uiMakanan.buildDetailList(makanan),
    );
  }
}

class WebMakanan extends StatelessWidget {
  final ModelMakanan makanan;

  WebMakanan({Key key, @required this.makanan}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(makanan.namaMkn),
      ),
      url: makanan.urlMkn,
    );
  }
}
