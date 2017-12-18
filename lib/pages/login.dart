import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  State createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.fromLTRB(50.0, 125.0, 50.0, 0.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new RichText(
                text: new TextSpan(
                  text: "Liszt",
                  style: new TextStyle(
                    fontSize: 65.0,
                    color: Colors.blueGrey[300],
                  )
                ),
              ),
            new Container (
              margin: const EdgeInsets.only(top: 50.0),
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "username"),
              ),
            ),
            new Container (
              margin: const EdgeInsets.only(top: 40.0),
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "password"),
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(top: 40.0),
              width: 250.0,
              height: 35.0,
              child: new FlatButton(
                onPressed: () {
                  print("button");
                },
                child: new Text("Log in"),
                color: Colors.cyan[300],
                textColor: Colors.white70,
              ),
            ),
          ],
        )
      ),
    );
  }
}

