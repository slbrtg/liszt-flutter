import 'package:flutter/material.dart';
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
  };

  Routes() {
    runApp(new MaterialApp(
      title: "liszt",
      home: new WelcomeScreen(),
      routes: routes,
    ));
  }
}