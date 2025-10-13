import 'package:flutter/material.dart';

class CustomButtonClass extends StatelessWidget {
  const CustomButtonClass({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isdisable = true;
    return Scaffold(
      appBar: AppBar(
        title: Text("Elevated Buttons"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isdisable ? () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(" Button 1 Clicked")));
                } : null,
                // child: Icon(Icons.person_outline),
                child: Text("Button 1", style: TextStyle(fontSize: 15,),),
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.red,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    width: 1,
                  ),
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  // shape: CircleBorder(),

                  // disabledBackgroundColor: Colors.grey,
                  // alignment: Alignment.topRight,
                  elevation: 5,
                  overlayColor: Colors.red,
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  // visualDensity: VisualDensity(horizontal: 2, vertical: 3),

                ),
              ),
              InkWell(
                onTap: (){
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Inkwell Called")));
                },
                onTapCancel:(){
                  print("Cancel");
                },
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 40,
                  width: 100,

                ),
                borderRadius: BorderRadius.circular(20),
              ),

              GestureDetector(
                onTap: (){
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("GestureDectator Called")));

                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 40,
                  width: 100,


                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
