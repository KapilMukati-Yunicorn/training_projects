//
import 'package:flutter/material.dart';
import 'package:training/advance_dart/generics.dart';
//
// class CustomAnimation extends StatefulWidget {
//   const CustomAnimation({super.key});
//
//   @override
//   State<CustomAnimation> createState() => _CustomAnimationState();
// }
//
// class _CustomAnimationState extends State<CustomAnimation> {
//   bool isTapped = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Tween Animation")),
//       body: GestureDetector(
//         onTap: () {
//           setState(() {
//             isTapped = !isTapped;
//           });
//         },
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           color: Colors.grey[200],
//           child: TweenAnimationBuilder<Offset>(
//             tween: Tween<Offset>(
//               begin: Offset(0, 0),
//               end: isTapped ? Offset(200, 300) : Offset(0, 0),
//             ),
//             duration: const Duration(seconds: 2),
//             curve: Curves.easeInOut,
//             builder: (context, offset, child) {
//               return Transform.translate(
//                 offset: offset,
//                 child: child,
//               );
//             },
//             child: Container(
//               width: 100,
//               height: 100,
//               color: Colors.green,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//

// class CustomAnimation extends StatefulWidget {
//   const CustomAnimation({super.key});
//
//   @override
//   State<CustomAnimation> createState() => _CustomAnimationState();
// }
//
// class _CustomAnimationState extends State<CustomAnimation> {
//   bool changeEffect = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Tween Animation"),
//         centerTitle: true,
//         backgroundColor: Colors.cyan,
//       ),
//       body: InkWell(
//         onTap: () {
//           setState(() {
//             changeEffect = !changeEffect;
//           });
//         },
//         child: Container(
//           height: 100,
//           width: 100,
//           decoration: BoxDecoration(
//             color: Colors.green,
//             shape: BoxShape.circle,
//           ),
//           child: TweenAnimationBuilder(
//             tween: Tween<Offset>(
//               begin: Offset(0, 0),
//               end: changeEffect ? Offset(200, 300): Offset(0, 0),
//             ),
//             duration: Duration(seconds: 3),
//             builder: (context, offset, child) {
//               return Transform.translate(
//                 offset: offset,
//                 child: child,
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  const CustomAnimation({super.key});

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation> {
  bool changeEffect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animation"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body:   ,
    );
  }
}

