import 'package:flutter/material.dart';
import '../assets/palette.dart';
import 'package:liszt/services/firebaseAuth.dart';




class WelcomeScreen extends StatefulWidget {
  @override
  State createState() => new WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {

 /////////////////////////////////////////////////////////////////////////////
// BACKEND PROPERTIES
/////////////////////////////////////////////////////////////////////////////
  UserAuth userAuth = new UserAuth();
/////////////////////////////////////////////////////////////////////////////
// BACKEND METHODS
/////////////////////////////////////////////////////////////////////////////
  void navHomeIfLoggedIn() {
    userAuth.getCurrentUser().then((onVal){
      if (onVal == null){
        debugPrint(onVal.toString());
      } else {
        debugPrint(onVal.toString());
        Navigator.pushNamed(context, "/home");
      }
    });
  }
/////////////////////////////////////////////////////////////////////////////
// UI WIDGETS
/////////////////////////////////////////////////////////////////////////////
  Widget lisztBanner() => new Container(
    margin: const EdgeInsets.fromLTRB(45.0, 130.0, 0.0, 0.0),
    child: new RichText(
      text: new TextSpan(
          text: "Liszt",
          style: new TextStyle(
            fontSize: 65.0,
            color: primaryTextColor,
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
            color: primaryTextColor,
          )
      ),
    ),
  );

  Widget loginFlatButton() => new Container(
    margin: const EdgeInsets.fromLTRB(45.0, 75.0, 0.0, 0.0),
    width: 250.0,
    height: 40.0,
    child: new FlatButton(
      onPressed: () {
        debugPrint("login pressed");
        Navigator.pushNamed(context, "/login");

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

  Widget signUpFlatButton() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(45.0, 35.0, 0.0, 0.0),
      width: 250.0,
      height: 40.0,
      child: new FlatButton(
        onPressed: () {
          debugPrint("signup pressed");
          Navigator.pushNamed(context, "/signup");
        },
        child: new RichText(
          text: new TextSpan(
              text: "sign up",
              style: new TextStyle(
                fontSize: 22.0,
                color: primaryTextColor,
              )
          ),
        ),
        color: null,
      ),
    );
  }

  /////////////////////////////////////////////////////////////////////////////
  // UI LIFECYCLE AND BUILD
  /////////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    super.initState();
    navHomeIfLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 50.0, 0.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            lisztBanner(),
            lisztSlogan(),
            loginFlatButton(),
            signUpFlatButton(),
          ],
        ),
      ),
    );
  }
}

