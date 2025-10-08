import 'package:flutter/material.dart';

class CustomScrollViewWidget extends StatelessWidget {
  const CustomScrollViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Scroll View"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 20, top: 20, bottom: 10),
                child: Row(
                  children: [
                    // SizedBox(
                    //   height: size.height * 0.2,
                    //   width: MediaQuery.of(context).size.width,
                    //   // child: ListView.builder(
                    //   //    scrollDirection: Axis.horizontal,
                    //   //     itemCount: 10,
                    //   //     itemBuilder: (context, index){
                    //   //     return Container(
                    //   //       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    //   //       height: size.height,
                    //   //       width: size.width * 0.4,
                    //   //       color: Colors.blue[100 * ((index % 8) + 1)],
                    //   //       // color: Colors.blue,
                    //   //       child: Text("1"),
                    //   //     );
                    //   // }),
                    //
                    // )
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellow,
                      ),
                    ),
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.purple,
                      ),
                    ),
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                      ),
                    ),
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
