import 'package:flutter/material.dart';
import 'package:liszt/assets/palette.dart';
import 'package:liszt/services/firebaseData.dart';

class addPlaceScreen extends StatefulWidget {
  @override
  State createState () => new addPlaceScreenState();
}

class addPlaceScreenState extends State<addPlaceScreen> {

  /////////////////////////////////////////////////////////////////////////////
  // UI PROPERTIES
  /////////////////////////////////////////////////////////////////////////////
  UserData userData = new UserData();

  /////////////////////////////////////////////////////////////////////////////
  // UI PROPERTIES
  /////////////////////////////////////////////////////////////////////////////
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _placeNameTextController = new TextEditingController();
  final TextEditingController _placePeopleTextController = new TextEditingController();
  /////////////////////////////////////////////////////////////////////////////
  // UI WIDGETS
  /////////////////////////////////////////////////////////////////////////////

  Widget addPlaceBanner() => new Container(
    margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
    child: new RichText(
      text: new TextSpan(
          text: "New Place",
          style: new TextStyle(
            fontSize: 45.0,
            color: primaryTextColor,
          )
      ),
    ),
  );

  Widget placeNameTextFormField() {
    return new Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: new TextFormField(
        decoration: new InputDecoration(
          hintText: "Home, school, work, etc...",
          icon: new Container(
            child: new Icon(Icons.account_balance),
          ),
        ),
        controller: _placeNameTextController,
      ),
    );
  }

  Widget placePeopleTextFormField() {
    return new Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: new TextFormField(
        decoration: new InputDecoration(
          hintText: "roommate, family member, etc..",
          icon: new Container(
            child: new Icon(Icons.people),
          ),
        ),
        controller: _placeNameTextController,
      ),
    );
  }

  Widget userForm()=> new Form(
    key: formKey,
    child: new Column(
      children: <Widget>[
        placeNameTextFormField(),
        placePeopleTextFormField(),
      ],
    ),
  );

  Widget addPlaceFlatButton() => new Container(
    margin: const EdgeInsets.fromLTRB(0.0, 75.0, 0.0, 0.0),
    width: 250.0,
    height: 40.0,
    child: new FlatButton(
      onPressed: () {
        setState(() {
          debugPrint("attempting to login");
        });
      },
      child: new RichText(
        text: new TextSpan(
          text: "Add Place",
          style: new TextStyle(
            fontSize: 22.0,
            color: loginSignupButtonTextColor,
          ),
        ),
      ),
      color: loginSignupButtonColor,
    ),
  );

  /////////////////////////////////////////////////////////////////////////////
  // UI BUILD
  /////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    userData.retrieveCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: appBarColor,
      ),
      body: new Column(
        children: <Widget>[
          addPlaceBanner(),
          userForm(),
          addPlaceFlatButton(),
        ],
      ),
    );
  }
}