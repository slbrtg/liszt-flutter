import 'package:flutter/material.dart';
import './pages/login.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/login": (BuildContext context) => new LoginScreen(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: "liszt",
      home: new LoginScreen(),
      routes: routes,
    ));
  }
}