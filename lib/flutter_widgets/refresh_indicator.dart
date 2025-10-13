import 'package:flutter/material.dart';
import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';

class RefreshExample extends StatefulWidget {
  @override
  _RefreshExampleState createState() => _RefreshExampleState();
}

class _RefreshExampleState extends State<RefreshExample> {
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();
  List<String> _items = List.generate(10, (i) => 'Item ${i + 1}');
  bool _loading = false;

  Future<void> _handleRefresh() async {
    setState(() => _loading = true);
    try {
      // Simulate network call
      await Future.delayed(Duration(seconds: 2));
      // New items add kar rahe hain
      final newItems = List.generate(
        3,
        (i) => 'New ${DateTime.now().second} - ${i + 1}',
      );
      setState(() {
        _items = [...newItems, ..._items];
      });
    } catch (e) {
      // Error handling
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Refresh failed: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RefreshIndicator Demo')),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        key: _refreshKey,
        onRefresh: _handleRefresh,
        displacement: 50,
        strokeWidth: 3,
        color: Colors.black,
        backgroundColor: Colors.red,
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: _items.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Fluttertoast.showToast(
                msg: "Items",
                // backgroundColor: Colors.green,
                // textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                // webBgColor: #FF5722,
                webPosition: "center",
              ),

              // Fluttertoast.showToast(
              //   // webBgColor: "linear-gradient(to right, #00b09b, #96c93d)", // required for web
              //   // webPosition: "center", // optional: "top", "center", "bottom"
              //   msg: "Item added to cart!",
              //   // toastLength: Toast.LENGTH_LONG,
              //   gravity: ToastGravity.TOP,
              //   backgroundColor: Colors.green,
              //   textColor: Colors.white,
              //   fontSize: 18,
              //
              //   // fontAsset: "Hello"
              // );

              // () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   // SnackBar(
              //   //   content: Text("Item $index clicked"),
              //   //   backgroundColor: Colors.blue,
              //   //   behavior: SnackBarBehavior.floating,
              //   //   actionOverflowThreshold: 1,
              //   //   // elevation: 20,
              //   //   // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              //   //   // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              //   //   // width: 20,
              //   //   // shape: RoundedRectangleBorder(
              //   //   //   borderRadius: BorderRadius.only(
              //   //   //     topLeft: Radius.circular(12),
              //   //   //     topRight: Radius.circular(12),
              //   //   //   ),
              //   //
              //   //   // ),
              //   //   showCloseIcon: true,
              //   //   // hitTestBehavior: HitTestBehavior.opaque,
              //   //   // duration: Duration(seconds: 20),
              //   //   // closeIconColor: Colors.white,
              //   //   onVisible: () {
              //   //     showDialog(
              //   //       context: context,
              //   //       builder: (BuildContext context) {
              //   //         return AlertDialog(
              //   //           title: Text("Title"),
              //   //           content: Text("This is a simple alert dialog"),
              //   //           actions: [
              //   //             TextButton(
              //   //               child: Text("OK"),
              //   //               onPressed: () {
              //   //                 Navigator.of(context).pop(); // close dialog
              //   //               },
              //   //             ),
              //   //           ],
              //   //         );
              //   //       },
              //   //     );
              //   //   },
              //   //
              //   // ),
              //
              //     SnackBar(
              //       content: Row(
              //         mainAxisAlignment: MainAxisAlignment.center, // center text/icon
              //         children: [
              //           Icon(Icons.info, color: Colors.white),
              //           SizedBox(width: 8),
              //           Text("Top Center SnackBar")
              //         ],
              //       ),
              //       behavior: SnackBarBehavior.floating,
              //     ),
              // );

              // },
              // splashColor: Colors.red,
              child: index == 2
                  ? Visibility(
                      child: ListTile(title: Text(_items[index])),
                      visible: false,
                      maintainAnimation: true,
                      replacement: SizedBox.shrink(),
                      maintainState: true,
                      maintainSize: true,

                    )
                  : ListTile(title: Text(_items[index])),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.refresh),
      //   onPressed: () {
      //     print("FAB pressed — showing indicator");
      //     _refreshKey.currentState?.show();
      //   },
      // ),
    );
  }
}

class CustomToast extends StatefulWidget {
  const CustomToast({super.key});

  @override
  State<CustomToast> createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Toast")),
      body: ElevatedButton(
        onPressed: () {
          Fluttertoast.showToast(
            // webBgColor: "linear-gradient(to right, #00b09b, #96c93d)", // required for web
            // webPosition: "center", // optional: "top", "center", "bottom"
            msg: "Item added to cart!",
            // toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18,

            // fontAsset: "Hello"
          );
        },
        child: Text("Add Item"),
      ),
    );
  }
}
