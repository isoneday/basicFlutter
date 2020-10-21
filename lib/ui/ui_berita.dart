import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_portalberita.dart';
import 'package:flutter_app/screens/portalberita_screen.dart';

class UiBerita {
  Widget buildListBerita(List<Articles> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          Articles dataArticle = articles[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, DetailBerita.id,
                  arguments: dataArticle);
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
                      Image.network(
                        dataArticle?.urlToImage ??
                            "https://clipartstation.com/wp-content/uploads/2017/11/newspaper-clipart-png-7.png",
                        fit: BoxFit.fill,
                      ),
                      Text(dataArticle?.title ?? "No Title"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Text(dataArticle?.author ?? "no author")),
                          Flexible(
                              child: Text(
                                  dataArticle?.publishedAt.substring(0, 10) ??
                                      "no publishat")),
                        ],
                      )
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

  Widget buildDetailBerita(Articles articles) {
    return Column(
      children: [
        Image.network(
          articles?.urlToImage ??
              "https://clipartstation.com/wp-content/uploads/2017/11/newspaper-clipart-png-7.png",
          fit: BoxFit.fill,
        ),
        Text(
          articles?.title ?? "no title",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(articles?.description ?? "no description"),
        )
      ],
    );
  }
}
