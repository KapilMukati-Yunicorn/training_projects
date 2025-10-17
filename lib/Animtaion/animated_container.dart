import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({super.key});

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  bool changeEffect = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: InkWell(
          borderRadius: changeEffect
              ? BorderRadius.zero
              : BorderRadius.circular(30),
          onTap: () {
            setState(() {
              changeEffect = !changeEffect;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            height: changeEffect ? 100 :  200,
            width: changeEffect ? 100 : 250,
            decoration: BoxDecoration(
              color: changeEffect ? Colors.red : Colors.deepPurple,
              borderRadius: changeEffect
                  ? BorderRadius.zero
                  : BorderRadius.circular(30),
            ),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}
