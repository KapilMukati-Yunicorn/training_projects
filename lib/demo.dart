import 'package:flutter/material.dart';
import 'package:training/advance_dart/generics.dart';
class DemoClass extends StatelessWidget {
  const DemoClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Shadow layer
        Positioned(
          bottom: -10, // card ke neeche distance
          child: Container(
            width: 160, // card se thodi badi
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25), // soft shadow
              borderRadius: BorderRadius.circular(50), // elliptical shadow
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -10, // card ke neeche distance
          child: Container(
            width: 160, // card se thodi badi
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25), // soft shadow
              borderRadius: BorderRadius.circular(50), // elliptical shadow
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
        ),
        // Actual Card
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Text("Rectangle Card")),
        ),
      ],
    );
  }
}
    // return Container(
    //   width: 150,
    //   height: 150,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black12, // light, diffuse shadow
    //         blurRadius: 10,
    //         offset: Offset(0, 2),
    //       ),
    //       BoxShadow(
    //         color: Colors.black26, // stronger shadow
    //         blurRadius: 20,
    //         offset: Offset(0, 10),
    //       ),
    //       BoxShadow(
    //         color: Colors.black38, // darkest shadow near contact point
    //         blurRadius: 30,
    //         offset: Offset(0, 20),
    //       ),
    //     ],
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    // );


//     return Stack(
//       children: [
//         Container(
//           width: 200,
//           height: 200,
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey,
//                 offset: Offset(0, 10),
//                 blurRadius: 10,
//                 spreadRadius: 2,
//               ),
//             ],
//             shape: BoxShape.circle,
//             gradient: LinearGradient(
//               colors: [Colors.blue.shade200, Colors.lightGreen.shade200],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         Container(
//           width: 200,
//           height: 200,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: RadialGradient(
//               colors: [Colors.orangeAccent.withOpacity(0.5), Colors.orange.withOpacity(0.4), Colors.transparent],
//               center: Alignment.bottomLeft,
//             ),
//           ),
//         ),
//         // Container(
//         //   width: 200,
//         //   height: 200,
//         //   decoration: BoxDecoration(
//         //     shape: BoxShape.circle,
//         //     gradient: RadialGradient(
//         //       colors: [Colors.orangeAccent.withOpacity(0.5), Colors.orange.withOpacity(0.4), Colors.transparent],
//         //       center: Alignment.topRight,
//         //       radius: 0.5,
//         //       tileMode: TileMode.decal,
//         //     ),
//         //   ),
//         // ),
//         // Container(
//         //   width: 200,
//         //   height: 200,
//         //   decoration: BoxDecoration(
//         //     // shape: BoxShape.circle,
//         //     gradient: SweepGradient(colors: [Colors.red, Colors.blue])
//         //
//         //   ),
//         // )
//       ],
//     );
//
//   }
// }
