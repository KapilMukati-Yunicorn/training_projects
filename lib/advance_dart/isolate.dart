import 'dart:isolate';

void heavyTask(SendPort sendPort){
  int sum =0;
  for(int i =0; i<=10000000000; i++){
    sum += i;
  }
  sendPort.send(sum);
}


void main() async{
  final recievePort = ReceivePort();
  await Isolate.spawn(heavyTask, recievePort.sendPort);

  recievePort.listen((message){
    print(message);
    recievePort.close();
  });

  print("main isolate close");
}