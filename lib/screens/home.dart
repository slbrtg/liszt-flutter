import 'package:flutter/material.dart';
import '../assets/palette.dart';



class HomeScreen extends StatefulWidget {
  @override
  State createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

  List<Widget> lisztTabs = const <Widget>[
    const Tab(text: "places", icon:  const Icon(Icons.account_balance)),
    const Tab(text: "tasks", icon: const Icon(Icons.build)),
  ];

  Widget homeBanner() => new Container(
    margin: const EdgeInsets.fromLTRB(60.0, 50.0, 0.0, 0.0),
    child: new RichText(
      text: new TextSpan(
          text: "Upcoming Tasks",
          style: new TextStyle(
            fontSize: 25.0,
            color: blueGrey300,
          )
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController (
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: blueGrey900,
          bottom: new TabBar(
            isScrollable: false,
            tabs: lisztTabs,
            indicatorColor: pink100,
            labelColor: cyan300,
            unselectedLabelColor: pink100,
          ),
        ),

        drawer: new Drawer(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                currentAccountPicture: new CircleAvatar(
                  child: new Text(
                    "SA",
                    style: new TextStyle(fontSize: 30.0,),
                  ),
                  backgroundColor: white70,
                ),
                accountName: new Text("test"),
                accountEmail: new Text("test@mail.co"),
                decoration: new BoxDecoration(
                  color: Colors.black,
                ),
              ),
              new Flexible(
                child: new Column(

                ),
              )
            ],
          ),
        ),
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


