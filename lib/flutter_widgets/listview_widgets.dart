import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyListViewWidget extends StatelessWidget {
  const MyListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: products.map((product) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: Image.network(
                product.imgUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "₹${product.price}\n${product.description}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: product.isAvailable
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : Icon(Icons.remove_circle, color: Colors.red),
              isThreeLine: true,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Tapped on product: ${product.name}")),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Product {
  String id;
  String name;
  String description;
  int price;
  String imgUrl;
  bool isAvailable;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imgUrl,
    required this.isAvailable,
  });
}

String imagepath =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw7Ruc3aDfDuCbY_FFQ-23U1on7qndeh-dNw&s";

List<Product> products = [
  Product(
    id: "P001",
    name: "Smartphone X1",
    description: "6.5-inch display, 128GB storage, 6GB RAM",
    price: 29999,
    imgUrl: imagepath,
    isAvailable: true,
  ),
  Product(
    id: "P002",
    name: "Wireless Earbuds",
    description: "Noise cancelling, 24hr battery life",
    price: 4999,
    imgUrl: imagepath,
    isAvailable: true,
  ),
  Product(
    id: "P003",
    name: "Smartwatch S2",
    description: "Heart rate monitor, GPS, Waterproof",
    price: 7999,
    imgUrl: imagepath,
    isAvailable: false,
  ),
  Product(
    id: "P004",
    name: "Laptop Pro 14",
    description: "Intel i7, 16GB RAM, 512GB SSD",
    price: 84999,
    imgUrl: imagepath,
    isAvailable: true,
  ),
  Product(
    id: "P005",
    name: "Bluetooth Speaker",
    description: "Portable, 12hr battery, Waterproof",
    price: 2999,
    imgUrl: imagepath,
    isAvailable: true,
  ),
  Product(
    id: "P006",
    name: "Gaming Mouse",
    description: "RGB Lighting, 16000 DPI",
    price: 2499,
    imgUrl: imagepath,
    isAvailable: false,
  ),
  Product(
    id: "P007",
    name: "4K LED TV 55\"",
    description: "Ultra HD, Smart TV, HDR10+",
    price: 54999,
    imgUrl: imagepath,
    isAvailable: true,
  ),
  Product(
    id: "P008",
    name: "External Hard Drive",
    description: "2TB, USB 3.0, Portable",
    price: 3999,
    imgUrl: imagepath,
    isAvailable: true,
  ),
  Product(
    id: "P009",
    name: "Wireless Keyboard",
    description: "Ergonomic, Long Battery Life",
    price: 1999,
    imgUrl: imagepath,
    isAvailable: true,
  ),
  Product(
    id: "P010",
    name: "Action Camera",
    description: "4K Video, Waterproof, WiFi",
    price: 10999,
    imgUrl: imagepath,
    isAvailable: false,
  ),
];

class MyListViewBuilderWidget extends StatelessWidget {
  const MyListViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Builder Widget"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: ListView.builder(
        itemCount: 100,
        physics: ClampingScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.start,
        // itemExtent: 100,
        // primary: false,
        // ListView.seperated()
        // separatorBuilder: (context, index){
        //    return Divider(thickness: 2,);
        // },
        prototypeItem: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: CircleAvatar(
            child: Center(
              child: Text(
                "",
                // "$index",
                // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            radius: 30,
          ),
          title: Text(
            "List Counter",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text("Subtitle"),
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                child: Center(
                  child: Text(
                    "$index",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                radius: 30,
              ),
              title: Text(
                "List Counter",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text("Subtitle"),
              trailing: index % 4 == 0
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : Icon(Icons.remove_circle, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}

class MyListViewBuilderWithController extends StatefulWidget {
  const MyListViewBuilderWithController({super.key});

  @override
  State<MyListViewBuilderWithController> createState() =>
      _MyListViewBuilderWithControllerState();
}

class _MyListViewBuilderWithControllerState
    extends State<MyListViewBuilderWithController> {
  ScrollController _scrollController = ScrollController();

  List<int> items = List.generate(20, (index) => index);

  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      // 1️⃣ Show/Hide FAB
      if (_scrollController.offset >= 300) {
        setState(() => _showBackToTopButton = true);
      } else {
        setState(() => _showBackToTopButton = false);
      }

      // 2️⃣ Detect bottom for infinite scroll
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreItems();
      }
    });
  }

  void loadMoreItems() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        items.addAll(List.generate(10, (index) => items.length + index));
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView + ScrollController"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        controller: _scrollController, // attach controller
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text("Item Index : ${items[index]}"));
        },
      ),
      floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              child: Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}

class MyGridViewWidget extends StatelessWidget {
  const MyGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Practice"),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: BouncingScrollPhysics(),

        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        childAspectRatio: 20 / 10, // width/height.
        children: List.generate(66, (index) {
          return Container(
            decoration: BoxDecoration(
              color: index % 2 == 0 ? Colors.black : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Text(
                '$index',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: index % 2 == 0 ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

void _voidCall(BuildContext context, int index) async {
  await ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text("${index + 1}")));
}

class MyGridViewBuilderWidget extends StatelessWidget {
  const MyGridViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isProcessing = false;

    Future<void> _voidCall(BuildContext context, int index) async {
      if (_isProcessing) return;

      _isProcessing = true;
      try {
        await ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Item ${index + 1}"))).closed;
      } finally {
        _isProcessing = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder"),
        centerTitle: true,
        surfaceTintColor: Colors.white,
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        physics: BouncingScrollPhysics(),
        // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //   maxCrossAxisExtent: 100,
        //   crossAxisSpacing: 10,
        //   mainAxisSpacing: 20,
        //   // mainAxisExtent: 10,
        //   childAspectRatio: 100/40,
        // ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisExtent: 80,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        clipBehavior: Clip.hardEdge,
        itemCount: 100,
        reverse: true,
        itemBuilder: (context, index) {
          return InkWell(
            // onTap: () {
            //   // ScaffoldMessenger.of(
            //   //   context,
            //   // ).showSnackBar(SnackBar(content: Text("${index + 1}")));
            //
            // },
            onTap: () {
              _voidCall(context, index);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: index % 2 == 0 ? Colors.lightGreenAccent : Colors.blue,
              ),
              child: Center(
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                    color: index % 2 == 0 ? Colors.black : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class ListViewBuildWidgetWithFirstCall extends StatelessWidget {
//   const ListViewBuildWidgetWithFirstCall({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     List<int> numbers = List.generate(40, (index)=> index+1);
//     print(numbers);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ListViewBuilderWidgetWithFirstCall" ),
//         centerTitle: true,
//         backgroundColor: Colors.cyan,
//       ),
//       body:Container(),
//     );
//   }
// }

class MyCustomWrapWidget extends StatelessWidget {
  const MyCustomWrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap Widget"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child:
        // Wrap(
        //   spacing: 10,
        //   runSpacing: 10,
        //   children: List.generate(
        //     13,
        //     (index) => Container(
        //       width: 70,
        //       height: 70,
        //       color: Color.fromARGB(
        //         225,
        //         random.nextInt(256),
        //         random.nextInt(256),
        //         random.nextInt(256),
        //       ),
        //       // color: Colors.purple[100 * ((index % 8) + 1)],
        //       alignment: Alignment.center,
        //       child: Text("${index + 1}"),
        //     ),
        //   ),
        // ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) => itemBox(index)),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(2, (index) => itemBox(index + 4)),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(2, (index) => itemBox(index + 7)),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) => itemBox(index + 9)),
              ),
            ],
          ),
        )

        // Wrap(
        //   spacing: 20,
        //   runSpacing: 10,
        //   // direction: Axis.vertical,
        //   // textDirection: TextDirection.rtl,
        //   // verticalDirection: VerticalDirection.up,
        //   alignment: WrapAlignment.center,
        //   // alignment: WrapAlignment.end,
        //   // alignment: WrapAlignment.start,
        //   //  crossAxisAlignment: WrapCrossAlignment.end,
        //
        //   children: List.generate(
        //     11,
        //     (index) => Chip(
        //       label: Text(
        //         "$index",
        //         style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        //       ),
        //       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  // Helper widget
  Widget itemBox(int index) => Container(
    width: 70,
    height: 70,
    margin: EdgeInsets.only(right: 10),
    color: Colors.teal[100 * ((index % 8) + 1)],
    alignment: Alignment.center,
    child: Text("${index + 1}"),
  );
}
