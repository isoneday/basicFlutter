import 'package:flutter/material.dart';
import 'package:flutter_app/ui/ui_minuman.dart';

class MinumanScreen extends StatelessWidget {
 final UIMinuman uiMinuman = UIMinuman();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid Minuman"),),
      body: uiMinuman.buildGridMinuman(),
    );
  }
}