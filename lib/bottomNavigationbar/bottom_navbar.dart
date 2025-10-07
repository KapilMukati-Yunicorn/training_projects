import 'package:flutter/material.dart';

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({super.key});

  @override
  State<BottomNavbarWidget> createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    Center(child: Text("Home Screen")),
    Center(child: Text("Search Screen")),
    Center(child: Text("Favorite Screen")),
    Center(child: Text("Person Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        // color: Colors.amber.shade200,
        child: _screens[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // backgroundColor: Colors.red,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        // showSelectedLabels: true,
        // showUnselectedLabels: true,
        // selectedLabelStyle: ,
        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            backgroundColor: Colors.grey.shade200,
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.save),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.favorite_outlined),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: "Home",
          ),
        ],
      ),


    // return Scaffold(
    //   appBar: AppBar(title: Text("Custom Navigation Bar"), centerTitle: true),
    //   body: Stack(
    //     children: [
    //       Align(
    //         alignment: Alignment.bottomCenter,
    //         child: Container(
    //           height: 80,
    //           color: Colors.cyan.shade200,
    //           child: SizedBox.expand(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                _selectedIndex==0? AnimatedContainer(
    //                  duration: Duration(milliseconds: 500),
    //                  curve: Curves.easeInOut,
    //                  child: Column(
    //                     children: [
    //                       IconButton(
    //                         onPressed: () {
    //                           setState(() {
    //                             _selectedIndex = 0;
    //                           });
    //                         },
    //                         icon: Icon(
    //                           Icons.home_outlined,
    //                           color: Colors.white,
    //                           size: 35,
    //                         ),
    //                       ),
    //                       Text("Home", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
    //                     ],
    //                   ),
    //                ):
    //                 IconButton(
    //                   onPressed: () {
    //                     setState(() {
    //                       _selectedIndex = 0;
    //                     });
    //                   },
    //                   icon: Icon(
    //                     Icons.home_outlined,
    //                     color: Colors.white,
    //                     size: 30,
    //                   ),
    //                 ),
    //                 IconButton(
    //                   onPressed: () {
    //                     setState(() {
    //                       _selectedIndex = 1;
    //                     });
    //                   },
    //                   icon: Icon(
    //                     Icons.search_outlined,
    //                     color: Colors.white,
    //                     size: 30,
    //                   ),
    //                 ),
    //                 IconButton(
    //                   onPressed: () {
    //                     setState(() {
    //                       _selectedIndex = 2;
    //                     });
    //                   },
    //                   icon: Icon(
    //                     Icons.favorite_outline,
    //                     color: Colors.white,
    //                     size: 30,
    //                   ),
    //                 ),
    //                 IconButton(
    //                   onPressed: () {
    //                     setState(() {
    //                       _selectedIndex = 3;
    //                     });
    //                   },
    //                   icon: Icon(
    //                     Icons.person_outline,
    //                     color: Colors.white,
    //                     size: 30,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //
    //       _screens[_selectedIndex],
    //       Container(
    //         // height: size.height - 153,
    //         // color: Colors.red.shade100,
    //       ),
    //     ],
    //   ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            print("clicked");
          },
          child: Icon(Icons.add),
        shape: CircleBorder(
          // side: BorderSide(color: Colors.red, width: 2,)
        ),
        // backgroundColor: Colors.blue,
        elevation: 10,
        autofocus: true,
        focusColor: Colors.red,
        foregroundColor: Colors.cyan,
        splashColor: Colors.green,
        // focusNode: FocusNode(canRequestFocus: true),
        tooltip: "Add Item",
        backgroundColor: Colors.teal,
        hoverElevation: 40,
        hoverColor: Colors.red,
        highlightElevation: 100,
      ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    //   floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Icon(Icons.add), shape: CircleBorder(),),
    );
  }
}
