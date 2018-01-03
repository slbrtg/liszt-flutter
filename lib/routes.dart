import 'package:flutter/material.dart';
import './screens/welcome.dart';
import './screens/signup.dart';
import './screens/login.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/welcome": (BuildContext context) => new WelcomeScreen(),
    "/login": (BuildContext context) => new LoginScreen(),
    "/signup": (BuildContext context) => new SignupScreen(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: "liszt",
      home: new WelcomeScreen(),
      routes: routes,
    ));
  }
}