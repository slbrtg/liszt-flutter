import 'package:flutter/material.dart';
import '../assets/palette.dart';



class HomeScreen extends StatefulWidget {
  @override
  State createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

  Widget homeBanner() => new Container(
    margin: const EdgeInsets.fromLTRB(45.0, 50.0, 0.0, 0.0),
    child: new RichText(
      text: new TextSpan(
          text: "Home",
          style: new TextStyle(
            fontSize: 65.0,
            color: blueGrey,
          )
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 50.0, 0.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            homeBanner(),
          ],
        ),
      ),
    );
  }
}