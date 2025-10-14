import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyCustomTabs extends StatefulWidget {
  const MyCustomTabs({super.key});

  @override
  State<MyCustomTabs> createState() => _MyCustomTabsState();
}

class _MyCustomTabsState extends State<MyCustomTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          // title: Text("My Tabs"),
          flexibleSpace: SafeArea(
            child: TabBar(
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 20),
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Home"),
                Tab(icon: Icon(Icons.search), text: "Search"),
                Tab(icon: Icon(Icons.person), text: "Person"),
                Tab(icon: Icon(Icons.chat), text: "Chat"),
                Tab(icon: Icon(Icons.home), text: "Home"),
                Tab(icon: Icon(Icons.search), text: "Search"),
                Tab(icon: Icon(Icons.person), text: "Person"),
                Tab(icon: Icon(Icons.chat), text: "Chat"),
              ],
              dividerHeight: 3,
              physics: BouncingScrollPhysics(),
              dividerColor: Colors.grey,
              indicatorWeight: 3,
              dragStartBehavior: DragStartBehavior.down,
              unselectedLabelColor: Colors.white,

              unselectedLabelStyle: TextStyle(
                color: Colors.red
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.blueGrey,
            child: Center(child: Text("Home"),),
          ),
          Container(
            color: Colors.amberAccent,
            child: Center(child: Text("Search"),),
          ),
          Container(
            color: Colors.greenAccent,
            child: Center(child: Text("Person"),),
          ),
          Container(
            color: Colors.redAccent,
            child: Center(child: Text("Chat"),),
          ),
          Container(
            color: Colors.purpleAccent,
            child: Center(child: Text("Home"),),
          ),
          Container(
            color: Colors.orangeAccent,
            child: Center(child: Text("Search"),),
          ),
          Container(
            color: Colors.amberAccent,
            child: Center(child: Text("Person"),),
          ),
          Container(
            color: Colors.yellowAccent,
            child: Center(child: Text("Chat"),),
          ),
        ]),
      ),
    );
  }
}
