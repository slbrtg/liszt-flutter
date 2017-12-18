import 'package:flutter/material.dart';
import 'package:liszt/pages/login.dart';


void main() => runApp(new Liszt());

class Liszt extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "liszt",
      home: new LoginScreen(),
    );
  }
}