import 'package:flutter/material.dart';

class ContainerClass extends StatelessWidget {
  const ContainerClass({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 130,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 140,
          width: 120,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.purple,
            // gradient: LinearGradient(
            //   colors: [Colors.blue, Colors.purple, Colors.orangeAccent],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   stops: [0.2, 0.3, 1.0],
            //   // transform: GradientRotation(3.14),
            // ),
            // border: Border(bottom: BorderSide(color: Colors.red)),
            gradient: RadialGradient(
              colors: [
                Colors.deepOrange,
                Colors.orangeAccent,
                Colors.blue.shade100,
              ],
              center: Alignment.bottomLeft,
              radius: 0.6,
            ),
            // shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 8),
                blurRadius: 15,
                spreadRadius: 1,
              ),

              // ========================
              // BoxShadow(
              //   color: Colors.blue,
              //   offset: Offset(0, 0),
              //   spreadRadius: 10,
              // ),
              // BoxShadow(
              //   color: Colors.grey.withOpacity(0.5),
              //   offset: Offset(0, 100),
              //   spreadRadius: -18,
              //   blurRadius: 30,
              //
              // ),
              // BoxShadow(
              //   color: Colors.redAccent,
              //   offset: Offset(-9, 0),
              //   spreadRadius: 10,
              // ),
              // BoxShadow(
              //     color: Colors.blue,
              //     offset: Offset(15, 0),
              //     spreadRadius: 10,
              // ),
              // BoxShadow(
              //     color: Colors.redAccent,
              //     offset: Offset(9, 0),
              //     spreadRadius: 10,
              // )
            ],
          ),

          child: Text('Container'),
        ),
      ],
    );
  }
}

class NewContainerClass extends StatelessWidget {
  const NewContainerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      alignment: Alignment.topRight,
      padding: EdgeInsets.only(top: 20, right: 20),
      child: Text("Container1"),
      decoration: BoxDecoration(
        color: Colors.red,
        // border: Border.all(
        //   color: Colors.green,
        //   width: 2,
        //   // strokeAlign: BorderSide.strokeAlignOutside,
        //   // strokeAlign: BorderSide.strokeAlignInside
        //   // strokeAlign: BorderSide.strokeAlignCenter,
        //
        // ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.elliptical(20, 10),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.elliptical(10, 20),
        ),
        // borderRadius: BorderRadius.all(
        //   Radius.elliptical(10, 50),
        //
        // )
      ),
      // foregroundDecoration: BoxDecoration(
      //
      // )
      // rotate..
      // transform: Matrix4.rotationZ(0.2),
      // transform: Matrix4.translationValues(0,0,0),

      // Skew..
      // transform: Matrix4.skewX(0.3),

      //   combine all
      transform: Matrix4.identity()
        ..translate(30.0, 10.0)
        ..rotateZ(0.5)
        ..scale(0.9),
    );
  }
}


