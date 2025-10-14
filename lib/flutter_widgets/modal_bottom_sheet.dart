import 'package:flutter/material.dart';

class MyCustomBottomSheet extends StatelessWidget {
  const MyCustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draggable Bottom Sheet"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              isScrollControlled: true,
              showDragHandle: true, // shows the small draggable indicator
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.3, // initial height (30% of screen)
                  minChildSize: 0.2, // minimum height
                  maxChildSize: 0.99, // maximum height when dragged
                  expand: false,
                  snap: true,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: ListView.builder(
                        controller: scrollController, // Important!
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.share),
                            title: Text("Share Option ${index + 1}"),
                            onTap: () {
                              Navigator.pop(
                                context,
                                "Share Option ${index + 1}",
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
          child: const Text("Show Draggable Bottom Sheet"),
        ),
      ),

      // Persistent bottom sheet : it define inside scaffold and it is fixed in nature.
      bottomSheet: BottomSheet(
        showDragHandle: true,
        onClosing: () {},
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2, // minimum height
            maxChildSize: 0.99,
            expand: false,

            builder: (context, scrollController) {
              return Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
