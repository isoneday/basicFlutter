import 'package:flutter/material.dart';

class FormLoginScreen extends StatefulWidget {
  @override
  _FormLoginScreenState createState() => _FormLoginScreenState();
}

class _FormLoginScreenState extends State<FormLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Center(child: Text("Form Login")),
        ),
        body: Form(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset(
                    "gambar/gambar3.png",
                    width: 300,
                    height: 200,
                  ),
                ),
                Text(
                  "Flutter Basic BPK",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.brown,
                          ),
                          hintText: "Input Your Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.brown,
                              )))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Colors.brown,
                          ),
                          hintText: "Input Your Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.brown,
                              )))),
                ),
              ],
            ),
          ),
        ));
  }
}
