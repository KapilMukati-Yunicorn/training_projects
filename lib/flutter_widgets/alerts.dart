import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class MyAlertWidget extends StatelessWidget {
  const MyAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alerts"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Delete Item"),
                        content: Text("Are you sure to delete this item?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.white,
                            ),
                            child: Text("Cancel"),

                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Item Deleted!!!!!!"), ),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                            child: Text("delete"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Alert Dialogue"),
              ),
              ElevatedButton(onPressed: () {
                ScaffoldMessenger.of(context)
                    ..hideCurrentMaterialBanner()
                    ..showMaterialBanner(
                     MaterialBanner( content: const Text("No internet connection!"),
                       leading: const Icon(Icons.wifi_off, color: Colors.white),
                       backgroundColor: Colors.redAccent,
                       actions: [
                         TextButton(
                             onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                             child: const Text("DISMISS", style: TextStyle(color: Colors.white))
                         )
                       ],
                     )
                    );

              }, child: Text("Material Banner")),
              ElevatedButton(onPressed: () {
                Flushbar(
                  title: "Warning",
                  message: "Your session will expire soon",
                  icon: const Icon(Icons.warning, color: Colors.yellow),
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.black87,
                  margin: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(8),
                  flushbarPosition: FlushbarPosition.BOTTOM, // top or bottom
                  animationDuration: const Duration(milliseconds: 500),
                ).show(context);
              }, child: Text("FlushBar")),
              
              ElevatedButton(onPressed: (){
                showDialog(context: context, builder: (context) {
                 return Dialog(
                   clipBehavior: Clip.hardEdge,
                   child: Container(
                     height: 200,
                     color: Colors.grey.shade200,
                     child: Column(
                       spacing: 20,
                       children: [
                         SizedBox(height: 10),
                         Text("Delete Item", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                         Text("Are you sure to delete this item?")
                       ],
                     ),
                   ),
                 );
                });
              }, child: Text("Custom Alert"))
            ],
          ),
        ],
      ),
    );
  }
}
