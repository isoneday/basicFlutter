import 'package:flutter/material.dart';
import 'package:flutter_app/model/modelquiz.dart';
import 'package:flutter_app/network/network.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Network network = Network();
  List<Result> result;

  getDataQuiz() {
    network.getDataQuiz().then((response) {
      result = response.results;
      return result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
        ),
        body: FutureBuilder(builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text("no data"));
              break;
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return errorData(snapshot);
              } else {
                return getListQuiz();
              }
              break;
            default:
          }
        }));
  }

  Widget errorData(AsyncSnapshot snapshot) {
    print("error information: ${snapshot.error}");
  }

  Widget getListQuiz() {}
}
