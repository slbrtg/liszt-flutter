import 'package:flutter/material.dart';
import '../assets/palette.dart';



class HomeScreen extends StatefulWidget {
  @override
  State createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

  /////////////////////////////////////////////////////////////////////////////
  // UI ASSETS
  /////////////////////////////////////////////////////////////////////////////

  List<Widget> lisztTabs = const <Widget>[
    const Tab(text: "places", icon:  const Icon(Icons.account_balance)),
    const Tab(text: "tasks", icon: const Icon(Icons.build)),
  ];

  /////////////////////////////////////////////////////////////////////////////
  // UI WIDGETS
  /////////////////////////////////////////////////////////////////////////////

  Widget homeDrawer() => new Drawer(
    child: new Column(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          currentAccountPicture: new CircleAvatar(
            child: new Text(
              "SA",
              style: new TextStyle(
                fontSize: 30.0,
              ),
            ),
            backgroundColor: white,
          ),
          accountName: new Text("test"),
          accountEmail: new Text("test@mail.co"),
          decoration: new BoxDecoration(
            color: homeAppBarColor,
          ),
        ),
        new Flexible(
          child: new Column(

          ),
        )
      ],
    )
  );


  /////////////////////////////////////////////////////////////////////////////
  // UI BUILD
  /////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController (
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black,
          bottom: new TabBar(
            isScrollable: false,
            tabs: lisztTabs,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
          ),
        ),

        drawer: homeDrawer(),
        body: new Container(
          child: new Container(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 50.0, 0.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
              ]
            ),
          ),
        ),
      ),
    );
  }
}


