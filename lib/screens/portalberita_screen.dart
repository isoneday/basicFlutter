import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_portalberita.dart';
import 'package:flutter_app/network/network_berita.dart';
import 'package:flutter_app/ui/ui_berita.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:toast/toast.dart';

class PortalBeritaScreen extends StatefulWidget {
  @override
  _PortalBeritaScreenState createState() => _PortalBeritaScreenState();
}

class _PortalBeritaScreenState extends State<PortalBeritaScreen> {
  bool loading;
  List<Articles> articles;
  NetworkBerita networkBerita = NetworkBerita();
  UiBerita uiBerita = UiBerita();
  @override
  void initState() {
    // TODO: implement initState
    getDataBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Portal Berita"),
      ),
      body: loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : uiBerita.buildListBerita(articles),
    );
  }

  void getDataBerita() {
    loading = true;
    networkBerita.getDataBerita().then((response) {
      if (response.status == "ok") {
        var articlesData = response.articles;
        print("status:" + response.status);
        setState(() {
          loading = false;
          articles = articlesData;
        });
        Toast.show("Data Berita Tersedia", context);
      } else {
        setState(() {
          loading = false;
        });
        Toast.show("Data Berita Tidak Tersedia", context);
      }
    });
  }
}

class DetailBerita extends StatelessWidget {
  final UiBerita uiBerita = UiBerita();
  final Articles articles;

  // DetailBerita(this.makanan);
  DetailBerita({Key key, @required this.articles}) : super(key: key);

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
                        builder: (context) => WebBerita(articles: articles)));
              })
        ],
      ),
      body: uiBerita.buildDetailBerita(articles),
    );
  }
}

class WebBerita extends StatelessWidget {
  final Articles articles;

  WebBerita({Key key, @required this.articles}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(articles.title),
      ),
      url: articles.url,
    );
  }
}
