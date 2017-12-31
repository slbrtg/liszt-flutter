import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  State createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _signingUp = false;
  bool _loggingIn = false;
  Widget emptyContainer = new Container(
    height: 0.0,
    width: 0.0,
  );

  dynamic lisztBannerTopMargin() {
    if (_signingUp) {
      return const EdgeInsets.only(top: 0.0);
    } else if (_loggingIn) {
      return const EdgeInsets.only(top: 35.0);
    } else return const EdgeInsets.only(top: 115.0);
  }

  Color blueGrey = Colors.blueGrey[300];
  Color cyan300 = Colors.cyan[300];
  Color white70 = Colors.white70;
  Color bgWhite = Colors.white12;

  Widget lisztBanner() => new Container(
      margin: lisztBannerTopMargin(),
      child: new RichText(
        text: new TextSpan(
            text: "Liszt",
            style: new TextStyle(
              fontSize: 65.0,
              color: blueGrey,
            )
        ),
      ),
    );

  Widget lisztSlogan() => new Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: new RichText(
        text: new TextSpan(
            text: "get your life together",
            style: new TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 27.0,
              color: blueGrey,
            )
        ),
      ),
    );

  Widget usernameTextFormField() {
    if(_loggingIn || _signingUp) {
      return new Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: new TextFormField(
          decoration: new InputDecoration.collapsed(hintText: "username"),
        ),
      );
    } else return emptyContainer;
  }

  Widget passwordTextFormField() {
    if(_loggingIn || _signingUp) {
      return new Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: new TextFormField(
          decoration: new InputDecoration.collapsed(hintText: "password"),
          obscureText: true,
        ),
      );
    } else return emptyContainer;
  }

  Widget confirmPasswordTextFormField() {
    if(_signingUp) {
      return new Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: new TextFormField(
          decoration: new InputDecoration.collapsed(hintText: "confirm password"),
          obscureText: true,
        ),
      );
    } else {
      return emptyContainer;
    }
  }

  Widget loginFlatButton() => new Container(
      margin: _loggingIn || _signingUp ? const EdgeInsets.only(
          top: 25.0) : const EdgeInsets.only(top: 75.0),
      width: 250.0,
      height: 40.0,
      child: new FlatButton(
        onPressed: () {
          setState(() {
            _loggingIn = true;
          });
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
    );

  Widget signUpFlatButton() {
    if (!_signingUp && !_loggingIn) {
      return new Container(
        margin: const EdgeInsets.fromLTRB(0.0, 35.0, 15.0, 0.0),
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
                  fontSize: 22.0,
                  color: blueGrey,
                )
            ),
          ),
          color: null,
        ),
      );
    } else return emptyContainer;
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _signingUp || _loggingIn ? new AppBar(
        leading: new FlatButton(
          onPressed: () {
            setState(() {
              _signingUp = false;
              _loggingIn = false;
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
            lisztBanner(),
            lisztSlogan(),
            usernameTextFormField(),
            passwordTextFormField(),
            confirmPasswordTextFormField(),
            loginFlatButton(),
            signUpFlatButton(),
          ],
        ),
      ),
    );
  }
}

