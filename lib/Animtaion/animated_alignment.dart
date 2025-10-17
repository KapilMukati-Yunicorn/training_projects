import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  Alignment _alignment = Alignment.center;
  bool changeEffect = true;

  void _changeAlignment() {
    setState(() {
      // randomly move widget to different corners
      if (_alignment == Alignment.center) {
        _alignment = Alignment.topRight;
      } else if (_alignment == Alignment.topRight) {
        _alignment = Alignment.bottomLeft;
      } else if (_alignment == Alignment.bottomLeft) {
        _alignment = Alignment.bottomRight;
      } else {
        _alignment = Alignment.center;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedAlign Example"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Stack(
          children: [
            // AnimatedAlign
            AnimatedAlign(
              alignment: changeEffect? Alignment.center : Alignment.bottomCenter,
              duration: const Duration(seconds: 3),
              curve: Curves.bounceOut,
              child: InkWell(
                onTap: (){
                  setState(() {
                    changeEffect = !changeEffect;
                  });
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeAlignment,
        child: const Icon(Icons.play_arrow),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
