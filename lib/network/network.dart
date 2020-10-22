import 'dart:convert';
import 'package:flutter_app/model/model_portalberita.dart';
import 'package:flutter_app/model/modelquiz.dart';
import 'package:http/http.dart' as http;

class NotFoundException implements Exception {
  String cause;
  NotFoundException(this.cause);
}

class Network {
  static String URL =
      "https://newsapi.org/v2/everything?q=covid&apiKey=9ba80533c8274efe96cb442df3512e5b";

static String quizUrl =
      "https://opentdb.com/api.php?amount=20";

  Future<Model_PortalBeritaa> getDataBerita() async {
    var responese = await http.get(Uri.encodeFull(URL));
    if (responese.statusCode == 200) {
      var data = json.decode(responese.body);
      Model_PortalBeritaa model_portalBeritaa =
          Model_PortalBeritaa.fromJson(data);
         
      return model_portalBeritaa;
    } else {
      if (responese.statusCode == 400) {
        throw NotFoundException("NOT FOUND");
      } else {
        throw Exception("UNABLE TO LOAD");
      }
    }
  }

  Future<ModelQuiz> getDataQuiz() async {
    var responese = await http.get(Uri.encodeFull(quizUrl));
    if (responese.statusCode == 200) {
      var data = json.decode(responese.body);
      ModelQuiz modelQuiz =
          ModelQuiz.fromJson(data);
         
      return modelQuiz;
    } else {
      if (responese.statusCode == 400) {
        throw NotFoundException("NOT FOUND");
      } else {
        throw Exception("UNABLE TO LOAD");
      }
    }
  }

}
