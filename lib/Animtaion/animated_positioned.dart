import 'package:flutter/material.dart';

class MyAnimatedPositioned extends StatefulWidget {
  const MyAnimatedPositioned({super.key});

  @override
  State<MyAnimatedPositioned> createState() => _MyAnimatedPositionedState();
}

class _MyAnimatedPositionedState extends State<MyAnimatedPositioned> {
  bool changeEffect = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Positioned"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: changeEffect ? 200 : 0,
            left: changeEffect ? 100 : 0,
            child: InkWell(
              onTap: (){
                 setState(() {
                   changeEffect = !changeEffect;
                 });
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                 color: Colors.orange,
                 shape: BoxShape.circle,
                ),
              ),
            ),
            duration: Duration(seconds: 2),
          ),
        ],
      ),
    );
  }
}
