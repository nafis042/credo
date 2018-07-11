import 'package:flutter/material.dart';
import './OverViewPage.dart' as first;
import './TeamPage.dart' as second;
import './TaskPage.dart' as third;
import './TalkPage.dart' as fourth;
import './MorePage.dart' as fifth;

class HomePage extends StatelessWidget {

  static String tag = 'home-page';


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Search Bar Demo',
        theme: new ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
        home: new TabbarHome());
  }
}

class TabbarHome extends StatefulWidget {
  @override
  _TabBarHomeState createState() => new _TabBarHomeState();
}




class _TabBarHomeState extends State<TabbarHome>  with SingleTickerProviderStateMixin{

  TabController controller;
  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //appBar: searchBar.build(context),

      bottomNavigationBar: new Material(
      shadowColor: Colors.black,
      elevation: 10.0,
      color: Colors.white,
      child: new TabBar(
      controller: controller,
      labelStyle: TextStyle(fontSize: 11.0),
      indicatorColor: Colors.white,
      labelColor: Color(0xFF25C27A),
      unselectedLabelColor: Color(0xFF404041),
      tabs: <Tab>[
      new Tab(icon: new ImageIcon(AssetImage("assets/overview.png"), size: 20.0), text: 'Overview'),
      new Tab(icon: new ImageIcon(AssetImage("assets/map.png"), size: 20.0), text: 'Team'),
      new Tab(icon: new ImageIcon(AssetImage("assets/Task.png"), size: 20.0), text: 'Task'),
      new Tab(icon: new ImageIcon(AssetImage("assets/Talk.png"), size: 20.0), text: 'Talk'),
      new Tab(icon: new ImageIcon(AssetImage("assets/More.png"), size: 20.0), text: 'More'),
      ]
      )
      ),
      body: new TabBarView(
      controller: controller,
      physics: new NeverScrollableScrollPhysics(),
    children: <Widget>[
    new first.OverViewPage(),
    new second.TeamPage(),
    new third.TaskPage(),
    new fourth.TalkPage(),
    new fifth.MorePage()
    ])
    );
  }
}

