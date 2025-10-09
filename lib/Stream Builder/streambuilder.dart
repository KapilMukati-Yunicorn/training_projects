import 'package:flutter/material.dart';

class MyCustomStreamBuilderClass extends StatefulWidget {
  const MyCustomStreamBuilderClass({super.key});

  @override
  State<MyCustomStreamBuilderClass> createState() => _MyCustomStreamBuilderClassState();
}

class _MyCustomStreamBuilderClassState extends State<MyCustomStreamBuilderClass> {
  @override
  Widget build(BuildContext context) {
    Stream<int> numberStream() async* {
      for (int i = 0; i <= 10; i++) {
        await Future.delayed(Duration(seconds: 1));
        yield i;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Builder"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(
        child: StreamBuilder(
          stream: numberStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }else if(snapshot.hasError){
              return Text("Error Occured: ${snapshot.error}");
            }else if(snapshot.hasData){
              return Text("Data : ${snapshot.data}");
            }else{
              return Text("Stream Close");
            }
          },
        ),
      ),
    );
  }
}
