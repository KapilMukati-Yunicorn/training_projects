import 'package:flutter/material.dart';

class CustomNavbarNavigationBarWidget extends StatefulWidget {
  const CustomNavbarNavigationBarWidget({super.key});

  @override
  State<CustomNavbarNavigationBarWidget> createState() =>
      _CustomNavbarNavigationBarWidgetState();
}

class _CustomNavbarNavigationBarWidgetState
    extends State<CustomNavbarNavigationBarWidget> {

  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Center(child: Text("Home Page"),),
    Center(child: Text("Search Page"),),
    Center(child: Text("Settings Page"),),
    Center(child: Text("Person Page"),),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation Bar"), centerTitle: true),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 80,
        backgroundColor: Colors.grey,
        elevation: 5,
        surfaceTintColor: Colors.blueGrey.shade300,
        animationDuration: Duration(milliseconds: 200),
        indicatorColor: Colors.deepPurpleAccent,
        selectedIndex: _selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        overlayColor: MaterialStateProperty.resolveWith<Color?>((
            Set<MaterialState> states,
            ) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.green; // when pressed
          }
          if (states.contains(MaterialState.hovered)) {
            return Colors.grey; // on hover
          }
          return null; // default
        }),
        labelTextStyle: MaterialStateProperty.all(TextStyle(
          color: Colors.blue,
        )),
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorShape: CircleBorder(),
        labelPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),

        destinations:const [
          NavigationDestination(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.home_outlined, color: Colors.white),
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search_outlined, color: Colors.white),
            ),
            label: "Search",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined, color: Colors.white),
            label: "Setting",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: Colors.white),
            label: "Person",
          ),
        ],
      ),
    );
  }
}
