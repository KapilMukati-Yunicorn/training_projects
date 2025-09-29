void main(){
  // list creation and adding and removing elements
  List<int> counts = [1,2,3,4,5];
  // counts.add(6);
  // print(counts);
  // for(var count in counts){
  //   print(count);
  // }
  //   counts.remove(5);
  // print(counts);


  //transform list items
  // counts = counts.map((e)=> e * 2).toList();
  // print(counts);


  // Map
  // Map<String, dynamic> user_data = {
  //   "name": "Raj",
  //   "age":22,
  //   "hobbies": ["playing", "reading", "dancing", "eating"]
  // };
  //
  // user_data['hobbies'].forEach((element){
  //   print(element);
  // });
  // print(user_data);
  //
  // print(user_data.keys);
  // print(user_data.keys.toList());



  // List of Map
  List<Map<String, dynamic>> users = [
    {
      "id": 101,
      "name": "Raj",
      "hobbies": ["Playing", "Reading Books", "Dancing", "Eating"]
    },
    {
      "id": 102,
      "name": "Ronak",
      "hobbies": ["Playing", "Exploring new Technologies"]
    },
    {
      "id": 103,
      "name": "Aditya",
      "hobbies": ["Listening Music", "Reading Newspaper"]
    },
    {
      "id": 104,
      "name": "Neha",
      "hobbies": ["Painting", "Cooking", "Traveling"]
    },
    {
      "id": 105,
      "name": "Aman",
      "hobbies": ["Gaming", "Coding", "Football"]
    },
    {
      "id": 106,
      "name": "Simran",
      "hobbies": ["Singing", "Gardening", "Dancing"]
    },
    {
      "id": 107,
      "name": "Vikas",
      "hobbies": ["Cricket", "Watching Movies", "Gym"]
    },
    {
      "id": 108,
      "name": "Priya",
      "hobbies": ["Sketching", "Shopping", "Yoga"]
    },
    {
      "id": 109,
      "name": "Karan",
      "hobbies": ["Swimming", "Cycling", "Chess"]
    },
    {
      "id": 110,
      "name": "Anjali",
      "hobbies": ["Reading Novels", "Cooking", "Dancing"]
    },
    {
      "id": 111,
      "name": "Rohit",
      "hobbies": ["Football", "Coding", "Traveling"]
    },
    {
      "id": 112,
      "name": "Megha",
      "hobbies": ["Photography", "Blogging", "Cooking"]
    },
    {
      "id": 113,
      "name": "Suresh",
      "hobbies": ["Running", "Meditation", "Cricket"]
    },
    {
      "id": 114,
      "name": "Pooja",
      "hobbies": ["Dancing", "Makeup", "Singing"]
    },
    {
      "id": 115,
      "name": "Arjun",
      "hobbies": ["Martial Arts", "Gaming", "Reading Comics"]
    },
  ];

  // Print all users
  // users.forEach((user) {
  //   print("ID: ${user["id"]}, Name: ${user["name"]}, Hobbies: ${user["hobbies"]}");
  // });

  // List<int> numbers = [10, 15, 20, 25, 30];
  // var evenNumbers = numbers.where((n)=> n% 2 == 0).toList();
  // print(evenNumbers);

  // Filter User Based on their Hobbies
  // var readingUsers = users
  // .where((user) => (user["hobbies"] as List).any(
  //     (hobby) => hobby.toString().toLowerCase().contains("reading"),
  // )).toList();
  //
  // print(readingUsers);
  // print(readingUsers.length);

  List<Map<String, dynamic>> newUsers = [
    {
      "id": 1,
      "name": "Raj",
      "profile": {
        "hobbies": ["Cricket", "Reading", "Coding"],
        "skills": ["Dart", "Flutter"]
      }
    },
    {
      "id": 2,
      "name": "Aman",
      "profile": {
        "hobbies": ["Football", "Gaming"],
        "skills": ["Java", "Spring Boot"]
      }
    },
    {
      "id": 3,
      "name": "Priya",
      "profile": {
        "hobbies": ["Dancing", "Singing", "Reading"],
        "skills": ["Python", "ML"]
      }
    }
  ];

  // not working properly only print empty list
  // var readingUsers = users
  //     .where(
  //       (user) =>
  //   (user['profile']?['hobbies'] as List?)?.any(
  //         (hobby) =>
  //         hobby.toString().toLowerCase().contains("reading"),
  //   ) ??
  //       false,
  // )
  //     .toList();

  // not working properly only print empty list
  // var readingUsers = users.where((user) {
  //   var hobbies = (user['profile']?['hobbies'] ?? []) as List;
  //   return hobbies.any(
  //         (hobby) => hobby.toString().toLowerCase().contains("reading"),
  //   );
  // }).toList();
  //
  // print(readingUsers);

  // not working properly only print empty list
  // var readingUsers = users.where((user) {
  //   var hobbies = (user['profile']?['hobbies'] ?? []) as List;
  //   return hobbies.toString().toLowerCase().contains("reading");
  // }).toList();
  //
  // print(readingUsers);

 // reduce
 //  List<int> numbers = [1,2,3,4,5,6];
 //
 //  int sum = numbers.reduce((prev, curr){
 //    print(prev+curr);
 //   return prev+curr;
 //  });
 //  // print(sum);
 //
 //  int multiply = numbers.reduce((prev, curr)=> prev*curr);
 //  print(multiply);


    List<Map<String, dynamic>> employees = [
      {
        "emp_id": 101,
        "name": "Raj",
        "company": "Google",
        "salary": 85000,
      },
      {
        "emp_id": 102,
        "name": "Aman",
        "company": "Microsoft",
        "salary": 92000,
      },
      {
        "emp_id": 103,
        "name": "Priya",
        "company": "Amazon",
        "salary": 78000,
      },
      {
        "emp_id": 104,
        "name": "Sneha",
        "company": "TCS",
        "salary": 60000,
      },
      {
        "emp_id": 105,
        "name": "Karan",
        "company": "Infosys",
        "salary": 65000,
      },
      {
        "emp_id": 106,
        "name": "Aditya",
        "company": "Apple",
        "salary": 100000,
      },
      {
        "emp_id": 107,
        "name": "Meena",
        "company": "Wipro",
        "salary": 58000,
      },
      {
        "emp_id": 108,
        "name": "Vikas",
        "company": "IBM",
        "salary": 72000,
      },
    ];

    //  way 1
  //   print(employees);
  // var totalSalary = employees.reduce(
  //         (a, b) => {
  //       "salary": (a["salary"] as int) + (b["salary"] as int)
  //     }
  // )["salary"];
  //
  // print("Total Salary Paid: $totalSalary");

//   way 2
//   var salaries =  employees.map((emp) => emp['salary'] as int).toList();
//   var total_Salary = salaries.reduce((a,b) => a+b);
//   print(total_Salary);

}