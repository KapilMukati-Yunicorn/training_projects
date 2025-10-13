import 'package:flutter/material.dart';

class PageViewDemoClass extends StatefulWidget {
  const PageViewDemoClass({super.key});

  @override
  State<PageViewDemoClass> createState() => _PageViewDemoClassState();
}

class _PageViewDemoClassState extends State<PageViewDemoClass> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page View Demo Class"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              // reverse: true,
              controller: _controller,
              // physics: BouncingScrollPhysics(),
              // padEnds: false,
              // pageSnapping: true,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  color: Colors.redAccent,
                  child: Center(
                    child: Text(
                      "Page 1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      "Page 2",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  color: Colors.amberAccent,
                  child: Center(
                    child: Text(
                      "Page 3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Text(
                      "Page 4",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Container(
                margin: EdgeInsets.all(4),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              int nextPage = _currentPage + 1;
              if (nextPage < 4) {
                _controller.animateToPage(
                  nextPage,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            ),
            child: Text("Next", style: TextStyle(fontSize: 18)),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
