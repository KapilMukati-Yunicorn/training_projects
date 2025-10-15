import 'package:flutter/material.dart';

class MyCustomListTileWidget extends StatelessWidget {
  const MyCustomListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListTile"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.cyan,
                child: Center(child: Text("$index")),
              ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8)),
              title: Text("Raj$index"),
              hoverColor: Colors.blueGrey.shade200,
              tileColor: Colors.blueGrey.shade50,
              // splashColor: Colors.green.shade100,
              // minTileHeight: 20,
              style: ListTileStyle.list,
              // textColor: Colors.red,
              focusColor: Colors.orange.shade100,
              autofocus: true,
              // enabled: false,
              horizontalTitleGap: 10,
              // isThreeLine: true,
              // enableFeedback: true,
              selected: false,
              // selectedColor: Colors.deepPurple,
              iconColor: Colors.red,
              selectedTileColor: Colors.green,
              visualDensity: VisualDensity(horizontal: 0.1, vertical: 0.6),
              subtitle: index%3==0 ? Text("Typing.....", style: TextStyle(color: Colors.green),) : SizedBox.shrink(),
              trailing: index%3==0 ? Text("online", style: TextStyle(color: Colors.green),) : Text("offline", style: TextStyle(color: Colors.red)),
              onTap: () async{
                final selected = await showModalBottomSheet<String>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent, // For rounded corners
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          statesController: WidgetStatesController(),
                          leading: const Icon(Icons.edit),
                          title: const Text("Edit"),
                          onTap: () => Navigator.pop(context, "Edit"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text("Delete"),
                          onTap: () => Navigator.pop(context, "Delete"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.share),
                          title: const Text("Share"),
                          onTap: () => Navigator.pop(context, "Share"),
                        ),
                      ],
                    ),
                  ),
                );
                // Show SnackBar with selected option
                if (selected != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("You selected: $selected")),
                  );
                }
              },

            ),
          );
          
      })
    );
  }
}





