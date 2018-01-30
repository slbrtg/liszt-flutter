import 'package:flutter/material.dart';
import '../assets/palette.dart';



class HomeScreen extends StatefulWidget {
  @override
  State createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  /////////////////////////////////////////////////////////////////////////////
  // UI ASSETS
  /////////////////////////////////////////////////////////////////////////////

  final List<Tab> lisztTabs = <Tab>[
    const Tab(text: "Places", icon:  const Icon(Icons.account_balance)),
    const Tab(text: "Tasks", icon: const Icon(Icons.build)),
  ];

  TabController _tabController;

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
        new Container (
          margin: const EdgeInsets.only(left: 10.0),
          child: new ListTile(
            leading: const Icon(Icons.event_seat),
            title: const Text('Add a place'),
          ),
        )
      ],
    )
  );

  Widget createFlatButton(String tabText) {
    String _buttonText;
    tabText == "Places" ? _buttonText = "Add a Place" : _buttonText = "Add a Task";
    return new Container(
      margin: const EdgeInsets.fromLTRB(0.0, 75.0, 0.0, 0.0),
      width: 250.0,
      height: 40.0,
      child: new FlatButton(
        onPressed: () {
          debugPrint(_buttonText + " pressed");
          tabText == "Places" ? Navigator.pushNamed(context, "/addPlace")
              : debugPrint("add task coming soon");
        },
      child: new RichText(
        text: new TextSpan(
          text: _buttonText,
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
  }

  /////////////////////////////////////////////////////////////////////////////
  // UI BUILD
  /////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: lisztTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: appBarColor,
        bottom: new TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: lisztTabs,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
        ),
      ),
      drawer: homeDrawer(),
      body: new TabBarView(
        controller: _tabController,
        children: lisztTabs.map((Tab tab) {
          return new Column (
            children: <Widget>[
              createFlatButton(tab.text),
            ],
          );
        }).toList(),
      ),
    );
  }
}


