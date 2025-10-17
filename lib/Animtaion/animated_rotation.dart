import 'package:flutter/material.dart';

class AnimatedRotationExample extends StatefulWidget {
  const AnimatedRotationExample({super.key});

  @override
  State<AnimatedRotationExample> createState() => _AnimatedRotationExampleState();
}

class _AnimatedRotationExampleState extends State<AnimatedRotationExample> {
  double _turns = 0.25; // rotation angle in turns (1.0 = full 360°)
  bool changeEffect = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Rotation Example"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: AnimatedRotation(
          turns: changeEffect ? _turns : 0.0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.refresh, color: Colors.white, size: 40),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          setState(() {
             changeEffect = !changeEffect;
            _turns += 0.25; // har press par 90° rotation
          });
        },
        child: const Icon(Icons.rotate_right),
      ),
    );
  }
}
