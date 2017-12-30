import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  State createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _signingUp = false;
  Widget emptyContainer = new Container(
    height: 0.0,
    width: 0.0,
  );

  Color blueGrey = Colors.blueGrey[300];
  Color cyan300 = Colors.cyan[300];
  Color white70 = Colors.white70;
  Color bgWhite = Colors.white12;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _signingUp ? new AppBar(
        leading: new FlatButton(
            onPressed: () {
              setState(() {
                _signingUp = false;
              });
            },
            child: new Row(
              children: <Widget>[
                new RichText(
                  text: new TextSpan(
                    text: "<",
                    style: new TextStyle(
                      fontSize: 28.0,
                      color: cyan300,
                    ),
                  ),
                ),
                new RichText(
                  text: new TextSpan(
                    text: "-",
                    style: new TextStyle(
                      fontSize: 28.0,
                      color: blueGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        backgroundColor: bgWhite,
        elevation: 0.0,
      ) : null,

      body: new Container(
        padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            // If/Else to adjust margin height for signing up
            new Container(
              margin: _signingUp ? const EdgeInsets.only(top: 0.0) : const EdgeInsets.only(top: 115.0),
              child: new RichText(
                text: new TextSpan(
                  text: "Liszt",
                  style: new TextStyle(
                    fontSize: 65.0,
                    color: blueGrey,
                  )
                ),
              ),
            ),
            new Container (
              margin: const EdgeInsets.only(top: 30.0),
              child: new TextFormField(
                decoration: new InputDecoration.collapsed(hintText: "username"),
              ),
            ),
            new Container (
              margin: const EdgeInsets.only(top: 35.0),
              child: new TextFormField(
                decoration: new InputDecoration.collapsed(hintText: "password"),
                obscureText: true,
              ),
            ),

            // If/Else to show confirm password if signing up. If not, empty container
            _signingUp ? new Container (
              margin: const EdgeInsets.only(top: 35.0),
              child: new TextFormField(
                decoration: new InputDecoration.collapsed(hintText: "confirm password"),
                obscureText: true,
              ),
            )
            : emptyContainer,


            new Container(
              margin: const EdgeInsets.only(top: 35.0),
              width: 250.0,
              height: 40.0,
              child: new FlatButton(
                onPressed: () {
                  print("login");
                },
                child: new RichText(
                  text: new TextSpan(
                    text: _signingUp ? "Sign up" : "Login",
                    style: new TextStyle(
                      fontSize: 22.0,
                      color: white70,
                    ),
                  ),
                ),
                color: Colors.cyan[300],
                textColor: white70,
              ),
            ),

            // Display sign up/login options on sign up view
            _signingUp ? new Container(
              margin: const EdgeInsets.fromLTRB(43.0,30.0,0.0, 0.0),
              width: 250.0,
              height: 50.0,
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: new CircleAvatar(
                      radius: 40.0,
                      child: new Text("G"),
                      backgroundColor: cyan300,
                    ),
                  ),
                  new Container(
                    child: new CircleAvatar(
                      radius: 40.0,
                      child: new Text("F"),
                      backgroundColor: cyan300,
                    ),
                  ),
                ],
              ),
            )
            : emptyContainer,

            // If/Else to show the sign up forms
            !_signingUp ? new Container(
              margin: const EdgeInsets.fromLTRB(0.0,40.0,15.0, 0.0),
              width: 250.0,
              height: 40.0,
              child: new FlatButton(
                onPressed: () {
                  setState(() {
                    _signingUp = true;
                  });
                },
                child: new RichText(
                  text: new TextSpan(
                      text: "sign up",
                      style: new TextStyle(
                        fontSize: 25.0,
                        color: blueGrey,
                      )
                  ),
                ),
                color: null,
                textColor: blueGrey,
              ),
            )
            : emptyContainer,
          ],
        ),
      ),
    );
  }
}

