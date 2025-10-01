enum Colors { red, green, blue,}

enum Status {
  pending(1),
  approved(2),
  reject(3);

  final int code;
  const Status(this.code);
  void showStatus() => print("Status Code: $code");
}

// enum Status {
//   pending(1),
//   approved(2),
//   rejected(3);
//
//   final int code;
//   const Status(this.code);
//
//   void showStatus() => print("Status code: $code");
// }




void main(){
  var s = Status.approved;
  // print(s);
  // print(s.code);
  // s.showStatus();
  // print(Colors.red);
  // print(Colors.green.index);
  // print(Colors.values);
}




















