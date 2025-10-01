// Without Generic
class Box{
  String value;
  Box(this.value);
}

// Generic Class
class NewBox<T>{
  T value;
  NewBox(this.value);
}

class _testing{
  String? value;
  _testing(this.value);
}

class A extends _testing{
  A(String value):super(value);
}

void main(){
  var B = Box("Hello");
  print(B.value);

  var stringBox = NewBox<String>("Hello");
  var intBox = NewBox<int>(12);
  var listofnums = NewBox<List<int>>([1,2,3,4,5,6]);
  var mapofUsers = NewBox<List<Map<String, dynamic>>>([
    {
      "name": "Raj",
      "age": 22,
    },
    {
      "name": "Karan",
      "age": 23,
    },
    {
      "name": "sunny",
      "age": 49,
    }
  ]);

  print(stringBox.value);
  print(intBox.value);
  print(listofnums.value);
  print(mapofUsers.value);



}