import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/authentication.dart';
import '../models/user.dart';


class LoginScreen extends StatefulWidget {
  @override
  State createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  /////////////////////////////////////////////////////////////////////////////
  // BACKEND PROPERTIES
  /////////////////////////////////////////////////////////////////////////////
  User user = new User();
  UserAuth userAuth = new UserAuth();
  bool _signingUp = false;
  bool _loggingIn = false;
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _usernameTextController = new TextEditingController();
  final TextEditingController _passwordTextController = new TextEditingController();
  final TextEditingController _emailTextController = new TextEditingController();

  /////////////////////////////////////////////////////////////////////////////
  // BACKEND METHODS
  /////////////////////////////////////////////////////////////////////////////
  void _login() {
    final form = formKey.currentState;
    if (form.validate()){
      form.save();
      userAuth.loginUser(user).then((onValue) {
        if (onValue == "user logged in")
          debugPrint("user logged in!");
        // Navigator.pushNamed(context, "/HomePage");
      }).catchError((PlatformException onError) {
        debugPrint(onError.message);
      });
    }
  }

  void _signup() {
    final form = formKey.currentState;
    if (form.validate()){
      form.save();
      userAuth.signupUser(user).then((onValue) {
        if (onValue == "user created")
          debugPrint("user created!");
          // Navigator.pushNamed(context, "/HomePage");
      }).catchError((PlatformException onError) {
        debugPrint(onError.message);
      });
    }
  }
  
  /////////////////////////////////////////////////////////////////////////////
  //  UI ASSETS
  /////////////////////////////////////////////////////////////////////////////
  static const double SML = 45.0;
  Widget emptyContainer = new Container(
    height: 0.0,
    width: 0.0,
  );
  dynamic lisztBannerTopMargin() {
    if (_signingUp) {
      return const EdgeInsets.fromLTRB(SML, 0.0, 0.0, 0.0);
    } else if (_loggingIn) {
      return const EdgeInsets.fromLTRB(SML, 35.0, 0.0, 0.0);
    } else return const EdgeInsets.fromLTRB(SML, 115.0, 0.0, 0.0);
  }
  Color blueGrey = Colors.blueGrey[300];
  Color cyan300 = Colors.cyan[300];
  Color white70 = Colors.white70;
  Color bgWhite = Colors.white12;

  /////////////////////////////////////////////////////////////////////////////
  // UI WIDGETS
  /////////////////////////////////////////////////////////////////////////////

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
      margin: const EdgeInsets.fromLTRB(SML, 10.0, 0.0, 0.0),
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
          decoration: new InputDecoration(
            hintText: "username",
            icon: new Container(
              child: new Icon(Icons.person),
            ),
          ),
          controller: _usernameTextController,
          validator: (String val) => val.isEmpty ? "Username cannot be empty" : null,
          onSaved: (String val) => user.username = val,
        ),
      );
    } else return emptyContainer;
  }

  Widget passwordTextFormField() {
    if(_loggingIn || _signingUp) {
      return new Container(
        margin: const EdgeInsets.fromLTRB(0.0,30.0,0.0,0.0),
        child: new TextFormField(
          decoration: new InputDecoration(
            hintText: "password",
            icon: new Container(
              margin: const EdgeInsets.only(left: 0.0),
              child: new Icon(Icons.vpn_key),
            ),
          ),
          controller: _passwordTextController,
          validator: (String val) => val.isEmpty ? "password cannot be empty" : null,
          onSaved: (String val) => user.password = val,
          obscureText: true,
        ),
      );
    } else return emptyContainer;
  }

  Widget emailTextFormField() {
    if(_signingUp) {
      return new Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: new TextFormField(
          decoration: new InputDecoration(
            hintText: "email",
            icon: new Container(
              child: new Icon(Icons.alternate_email),
            ),

          ),
          controller: _emailTextController,
          validator: (String val) => val.contains(
              new RegExp("^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$"))
              ? null : "email is not valid",
          onSaved: (String val) => user.email = val,
        ),
      );
    } else {
      return emptyContainer;
    }
  }

  Widget userForm()=> new Form(
      key: formKey,
      child: new Column(
        children: <Widget>[
          usernameTextFormField(),
          emailTextFormField(),
          passwordTextFormField(),
        ],
      ),
    );

  Widget loginFlatButton() => new Container(
      margin: _loggingIn || _signingUp ? const EdgeInsets.fromLTRB(SML, 25.0, 0.0, 0.0) : const EdgeInsets.fromLTRB(SML, 75.0, 0.0, 0.0),
      width: 250.0,
      height: 40.0,
      child: new FlatButton(
        onPressed: () {
          setState(() {
            if (_signingUp) {
              debugPrint("signup pressed");
              _signup();
            } else if (_loggingIn) {
              debugPrint("login pressed");
              _login();
            } else {
              _loggingIn = true;
            }
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
        margin: const EdgeInsets.fromLTRB(SML, 35.0, 0.0, 0.0),
        width: 250.0,
        height: 40.0,
        child: new FlatButton(
          onPressed: () {
            setState(() {
              _signingUp = true;
              debugPrint(_loggingIn.toString());
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

  /////////////////////////////////////////////////////////////////////////////
  // UI BUILD
  /////////////////////////////////////////////////////////////////////////////
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
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 50.0, 0.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            lisztBanner(),
            lisztSlogan(),
            userForm(),
            loginFlatButton(),
            signUpFlatButton(),
          ],
        ),
      ),
    );
  }
}

