import 'package:flutter/material.dart';
import 'package:liszt/screens/addPlace.dart';
import 'package:liszt/screens/home.dart';
import './screens/welcome.dart';
import './screens/signup.dart';
import './screens/login.dart';

class Routes {


  var routes = <String, WidgetBuilder>{
    "/welcome": (BuildContext context) => new WelcomeScreen(),
    "/login": (BuildContext context) => new LoginScreen(),
    "/signup": (BuildContext context) => new SignupScreen(),
    "/home": (BuildContext context) => new HomeScreen(),
    "/addPlace": (BuildContext context) => new addPlaceScreen(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: "liszt",
      home: new WelcomeScreen(),
      routes: routes,
    ));
  }
}
//
//new Container(
//child: new Container(
//padding: const EdgeInsets.fromLTRB(10.0, 50.0, 50.0, 0.0),
//child: new Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//mainAxisSize: MainAxisSize.max,
//children: <Widget>[
//addPlaceFlatButton(),
//]
//),
//),
//),