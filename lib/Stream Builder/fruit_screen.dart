import 'dart:async';

import 'package:flutter/material.dart';

class MyFruitClass extends StatefulWidget {
  const MyFruitClass({super.key});

  @override
  State<MyFruitClass> createState() => _MyFruitClassState();
}

class _MyFruitClassState extends State<MyFruitClass> {
  StreamController<List<String>> _fruitController = StreamController();
  bool _dataload = false;
  bool _isloading = true;

  @override
  void initState(){
    super.initState();

    // _fruitController.stream.listen(
    //     (data) => print("Listner return Data : $data"),
    //     onError: (err)=> print("Listner error : $err"),
    //     onDone: () => print("Data loaded!!"),
    // );

    Future.delayed(Duration(seconds: 4), (){
      if(!_dataload){
         _isloading = false;
         _fruitController.addError("Data loading failed due to TimeOut");
      }
    });

    Future.delayed(Duration(seconds: 2), (){
      try{
        if(_isloading){
          _dataload = true;
          _isloading = false;
          _fruitController.add(['Apple', 'Mango', 'Banana']);
        }
      }catch(err){
        _isloading = false;
        _fruitController.addError("Internal Error: $err");
      }
    });
    

  }

  @override
  void dispose(){
    _fruitController.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FruitScreen"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: StreamBuilder<List<String>>(
          stream: _fruitController.stream,
          builder: (context, snapshot){
             if(snapshot.connectionState == ConnectionState.waiting){
               return Center(child: CircularProgressIndicator());
             }else if(snapshot.hasError){
               return Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.error, color: Colors.red, size: 50),
                     SizedBox(height: 30),
                     Text('error: ${snapshot.error}', style: TextStyle(
                       fontSize: 18,
                       color: Colors.red,
                     ),
                       textAlign: TextAlign.center,
                     ),

                   ],
                 ),
               );
             }else if(!snapshot.hasData || snapshot.data!.isEmpty){
               return  Center(
                 child: Text("No Fruit Found"),
               );
             }else{
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                    return ListTile(
                      title: Text(snapshot.data![index]),
                    );
                });
             }
      }),
    );
  }
}
