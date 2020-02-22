import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }
}

class _MyState extends State<StatefulWidget> {
  insert() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('email', te1.text);
    await prefs.setString('password', te2.text);
  }

  read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    email = prefs.getString('email');
    password = prefs.getString('password');

    setState(() {});
  }

  TextEditingController te1 = new TextEditingController();
  TextEditingController te2 = new TextEditingController();
  String email = "______________";
  String password = "______________";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
            title: Text(
              "Storage Example",
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.pinkAccent),
        body: new Container(
          padding: EdgeInsets.all(10.0),
          child: new Center(
            child: new Form(
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    controller: te1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  new TextFormField(
                    controller: te2,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        border: OutlineInputBorder()),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  new Row(
                    children: <Widget>[
                      new RaisedButton(
                        onPressed: insert,

                        color: Colors.pinkAccent,
                        disabledColor: Colors.pinkAccent, //add
                        textColor: Colors.white,
                        child: new Text(
                          'INSERT',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(right: 20)),
                      new RaisedButton(
                        onPressed: read,
                        child: new Text(
                          'READ',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.pinkAccent,
                        disabledColor: Colors.pinkAccent,
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  new Text(
                    "$email",
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  new Text(
                    "$password",
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.pinkAccent,
          child: new Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
