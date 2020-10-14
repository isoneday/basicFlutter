import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FormLoginScreen extends StatefulWidget {
  @override
  _FormLoginScreenState createState() => _FormLoginScreenState();
}

class _FormLoginScreenState extends State<FormLoginScreen> {
  //deklarasi variable global
  var formKey = GlobalKey<FormState>();
  bool validasi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Center(child: Text("Form Login")),
        ),
        body: SingleChildScrollView(
          child: Form(
            autovalidate: validasi,
            key: formKey,
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
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: validasiEmail,
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
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: TextFormField(
                        validator: validasiPassword,
                        keyboardType: TextInputType.text,
                        obscureText: true,
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Container(
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          cekValidasi(context);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.brown,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  String validasiEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value.trim()))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validasiPassword(String value) {
    if (value.length < 6) {
      return 'password harus lebih besar dari 5';
    } else {
      return null;
    }
  }

  void cekValidasi(BuildContext context) {
    if (formKey.currentState.validate()) {
      Toast.show("Validasi berhasil", context);
    } else {
      Toast.show("Validasi gagal", context);
    }
  }
}
