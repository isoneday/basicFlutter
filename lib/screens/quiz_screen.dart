import 'package:flutter/material.dart';
import 'package:flutter_app/model/modelquiz.dart';
import 'package:flutter_app/network/network.dart';

class QuizScreen extends StatefulWidget {
  static String id = "quiz";
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Network network = Network();
  List<Result> result;

  Future<List<Result>> getDataQuiz() async {
    return network.getDataQuiz().then((response) {
      result = response.results;
      print("data result:${response.results.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: FutureBuilder(
          future: getDataQuiz(),
          builder: (context, snapshot) {
            print("hasil ${snapshot.data}");
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
          }),
    );
  }

  Widget errorData(AsyncSnapshot snapshot) {
    print("error information: ${snapshot.error}");
  }

  Widget getListQuiz() {
    return ListView.builder(
      itemBuilder: (context, index) {
        Result dataResult = result[index];
        return Card(
            elevation: 7,
            shadowColor: Colors.blue,
            child: ExpansionTile(
              title: Column(
                children: [
                  Text(dataResult.question,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  FittedBox(
                    child: Row(
                      children: [
                        FilterChip(
                          backgroundColor: Colors.grey,
                          label: Text(dataResult.category),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FilterChip(
                          backgroundColor: Colors.grey,
                          label: Text(dataResult.difficulty),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Text(dataResult.type.startsWith("m") ? "M" : "B"),
              ),
              children: dataResult.incorrectAnswers
                  .map((e) => ListJawabanSoal(dataResult, index, e))
                  .toList(),
            ));
      },
      itemCount: result?.length ?? 0,
    );
  }
}

class ListJawabanSoal extends StatefulWidget {
  Result result;
  int index;
  String e;
  ListJawabanSoal(this.result, this.index, this.e);
  @override
  _ListJawabanSoalState createState() => _ListJawabanSoalState();
}
class _ListJawabanSoalState extends State<ListJawabanSoal> {
  Color warna = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.e == widget.result.correctAnswer) {
            warna = Colors.green;
          } else {
            warna = Colors.red;
          }
        });
      },
      title: Text(
        widget.e,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: warna,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
