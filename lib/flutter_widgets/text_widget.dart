import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      color: Colors.blue,
      child: Text(
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum excepturi ipsa consequatur labore soluta porro ullam quo! Repudiandae tempora aut doloribus ipsam temporibus excepturi culpa at quisquam ab quia nostrum labore nulla neque exercitationem mollitia recusandae iste adipisci nihil commodi, eos a, quaerat obcaecati magnam perspiciatis. Et voluptatem accusantium reiciendis.",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          // letterSpacing: 2,
          // wordSpacing: 2,
          // height: 1.5
          // decoration: TextDecoration.lineThrough,
          decoration: TextDecoration.underline,
          // decoration: TextDecoration.overline,
          // decorationColor: Colors.red
          // decorationThickness: 2
          // decorationStyle: TextDecorationStyle.dotted
          // decorationStyle: TextDecorationStyle.wavy,
        ),
        //  overflow: TextOverflow.fade,
        //  overflow: TextOverflow.visible,
        //  overflow: TextOverflow.clip,
        //  overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
