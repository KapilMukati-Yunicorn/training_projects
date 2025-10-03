import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.blue,
      shadowColor: Colors.yellow,
      elevation: 5,
      shape: CircleBorder(),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.greenAccent,
            height: 100,
            width: 100,
          ),
          SizedBox(height: 20),
          Text("Card Widget"),
        ],
      ),
    );
  }
}
