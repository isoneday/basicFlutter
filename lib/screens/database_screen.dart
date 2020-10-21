import 'package:flutter/material.dart';
import 'package:flutter_app/database/dbhelper.dart';
import 'package:flutter_app/model/user.dart';
import 'package:toast/toast.dart';

class DatabaseScreen extends StatefulWidget {
  static String id = "database";
  @override
  _DatabaseScreenState createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  var txtNameController = TextEditingController();
  var txtPhoneController = TextEditingController();
  var txtnEmailController = TextEditingController();
  List<User> items = List();
  bool _autoValidate = false;
  var formKey = GlobalKey<FormState>();
  bool flag = false;
  List<User> values;
  bool insertItem = false;
  var _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DB SQFLITE"),
      ),
      body: getAllUser(),
      floatingActionButton: buildFAB(),
    );
  }

  buildFAB() {
    return FloatingActionButton(
      onPressed: () => openAlertBox(null),
      child: Icon(Icons.add),
    );
  }

  openAlertBox(User user) {
    if (user != null) {
      txtNameController.text = user.name;
      txtPhoneController.text = user.phone;
      txtnEmailController.text = user.email;
      flag = true;
    } else {
      txtNameController.text = "";
      txtPhoneController.text = "";
      txtnEmailController.text = "";
      flag = false;
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        flag ? "Edit User" : "Add User",
                        style: TextStyle(fontSize: 28.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Form(
                      key: formKey,
                      autovalidate: _autoValidate,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: txtNameController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Add Name",
                              fillColor: Colors.grey[300],
                              border: InputBorder.none,
                            ),
                            validator: validateName,
                            onSaved: (String val) {
                              txtNameController.text = val;
                            },
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.phone,
                            controller: txtPhoneController,
                            decoration: InputDecoration(
                              hintText: "Add Phone",
                              fillColor: Colors.grey[300],
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                            validator: validatePhone,
                            onSaved: (String val) {
                              txtPhoneController.text = val;
                            },
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            controller: txtnEmailController,
                            decoration: InputDecoration(
                              hintText: "Add Email",
                              fillColor: Colors.grey[300],
                              border: InputBorder.none,
                            ),
                            maxLines: 1,
                            validator: validateEmail,
                            onSaved: (String val) {
                              txtnEmailController.text = val;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => flag ? editUser(user.id) : addUser(),
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xff00bfa5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0)),
                      ),
                      child: Text(
                        flag ? "Edit User" : "Add User",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Validation Check
  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else if (value.length > 30) {
      return 'Name must be less than 30 charater';
    } else
      return null;
  }

  String validatePhone(String value) {
    Pattern pattern = r'^[0-9]*$';
    RegExp regex = new RegExp(pattern);
    if (value.trim().length != 10)
      return 'Mobile Number must be of 10 digit';
    else if (value.startsWith('+', 0)) {
      return 'Mobile Number should not contain +91';
    } else if (value.trim().contains(" ")) {
      return 'Blank space is not allowed';
    } else if (!regex.hasMatch(value)) {
      return 'Characters are not allowed';
    } else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else if (value.length > 30) {
      return 'Email length exceeds';
    } else
      return null;
  }

  addUser() {
    if (formKey.currentState.validate()) {
      var user = User();
      user.name = txtNameController.text;
      user.phone = txtPhoneController.text;
      user.email = txtnEmailController.text;
      var dbherlper = Helper();
      dbherlper.insert(user).then((value) {
        txtNameController.text = "";
        txtPhoneController.text = "";
        txtnEmailController.text = "";
        Navigator.pop(context);
        Toast.show("berhasil insert Data,your name: ${value.name}", context);
        setState(() {
          insertItem = true;
        });
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  //get all data user
  getAllUser() {
    return FutureBuilder(
      builder: (context, snapshot) {
        return createListView(context, snapshot);
      },
      future: getData(),
    );
  }

  getData() async {
    var helper = Helper();
    await helper.getAllUsers().then((value) {
      items = value;
      if (insertItem == true) {
        _listKey.currentState.insertItem(values.length);
        insertItem = false;
      }
    });
    return items;
  }

  createListView(BuildContext context, AsyncSnapshot snapshot) {
    values = snapshot.data;
    if (values != null) {
      return new AnimatedList(
          key: _listKey,
          // controller: _scrollController,
          shrinkWrap: true,
          initialItemCount: values.length,
          itemBuilder: (BuildContext context, int index, animation) {
            return _buildItem(values[index], animation, index);
          });
    } else
      return Container();
  }

  _buildItem(User values, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          onTap: () => onItemClick(values),
          title: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.brown.shade800,
                      child: Text(
                        values.name.substring(0, 1).toUpperCase(),
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.account_circle),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width - 200),
                          child: Text(
                            values.name,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.phone),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: new Text(
                          values.phone.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.email),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width - 200),
                          child: new Text(
                            values.email.toString(),
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 10.0)),
                ],
              ),
            ],
          ),
          trailing: Column(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: IconButton(
                    color: Colors.black,
                    icon: new Icon(Icons.edit),
                    onPressed: () => onEdit(values, index)),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: IconButton(
                    color: Colors.black,
                    icon: new Icon(Icons.delete),
                    onPressed: () => onDelete(values, index)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  editUser(int id) {
    if (formKey.currentState.validate()) {
      var user = User();
      user.id = id;
      user.name = txtNameController.text;
      user.phone = txtPhoneController.text;
      user.email = txtnEmailController.text;
      var dbHelper = Helper();
      dbHelper.update(user).then((update) {
        txtNameController.text = "";
        txtPhoneController.text = "";
        txtnEmailController.text = "";
        Navigator.of(context).pop();
        setState(() {
          flag = false;
        });
      });
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  onItemClick(User values) {
    print("klik item ${values.name}");
  }

  onEdit(User values, int index) {
    openAlertBox(values);
  }

  onDelete(User values, int index) {
    var id = values.id;
    var dbHelper = Helper();
    dbHelper.delete(id).then((value) {
      User removedItem = items.removeAt(index);

      AnimatedListRemovedItemBuilder builder = (context, animation) {
        return _buildItem(removedItem, animation, index);
      };
      _listKey.currentState.removeItem(index, builder);
    });
  }
}
