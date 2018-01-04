import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/firebaseAuth.dart';
import '../assets/palette.dart';
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

  final formKey = new GlobalKey<FormState>();
  final TextEditingController _usernameTextController = new TextEditingController();
  final TextEditingController _passwordTextController = new TextEditingController();

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
        Navigator.pushNamed(context, "/home");
      }).catchError((PlatformException onError) {
        debugPrint(onError.message);
      });
    }
  }
  

  /////////////////////////////////////////////////////////////////////////////
  // UI WIDGETS
  /////////////////////////////////////////////////////////////////////////////

  Widget lisztBanner() => new Container(
    margin: const EdgeInsets.fromLTRB(45.0, 50.0, 0.0, 0.0),
    child: new RichText(
      text: new TextSpan(
          text: "Liszt",
          style: new TextStyle(
            fontSize: 65.0,
            color: blueGrey300,
          )
      ),
    ),
  );

  Widget lisztSlogan() => new Container(
    margin: const EdgeInsets.fromLTRB(45.0, 10.0, 0.0, 0.0),
    child: new RichText(
      text: new TextSpan(
          text: "get your life together",
          style: new TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 27.0,
            color: blueGrey300,
          )
      ),
    ),
  );

  Widget emailTextFormField() {
    return new Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: new TextFormField(
        decoration: new InputDecoration(
          hintText: "email",
          icon: new Container(
            child: new Icon(Icons.alternate_email),
          ),
        ),
        controller: _usernameTextController,
        validator: (String val) => val.contains(
            new RegExp("^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$"))
            ? null : "email is not valid",
        onSaved: (String val) => user.email = val,
      ),
    );
  }

  Widget passwordTextFormField() {
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
  }


  Widget userForm()=> new Form(
      key: formKey,
      child: new Column(
        children: <Widget>[
          emailTextFormField(),
          passwordTextFormField(),
        ],
      ),
    );

  Widget loginFlatButton() => new Container(
    margin: const EdgeInsets.fromLTRB(45.0, 75.0, 0.0, 0.0),
    width: 250.0,
    height: 40.0,
    child: new FlatButton(
      onPressed: () {
        setState(() {
          debugPrint("attempting to login");
          _login();
        });
      },
      child: new RichText(
        text: new TextSpan(
          text: "Login",
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


  /////////////////////////////////////////////////////////////////////////////
  // UI BUILD
  /////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: blueGrey900,
        title: new Text("login"),
      ),
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
          ],
        ),
      ),
    );
  }
}

