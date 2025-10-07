// import 'package:flutter/material.dart';
//
// class DrawerItemModel {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;
//
//   DrawerItemModel({
//     required this.icon,
//     required this.title,
//     required this.onTap,
//   });
// }
//
// class DrawerItemWidget extends StatelessWidget {
//   final DrawerItemModel item;
//   final bool isLogout;
//
//   const DrawerItemWidget({
//     super.key,
//     required this.item,
//     this.isLogout = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0, right: 30),
//       child: ListTile(
//         leading: Icon(item.icon, size: 26),
//         title: Text(
//           item.title,
//           style: TextStyle(
//             // color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         trailing: isLogout
//             ? null
//             : const Icon(
//                 Icons.arrow_forward_ios,
//                 // color: Colors.white70,
//                 size: 18,
//               ),
//         tileColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(40),
//             bottomRight: Radius.circular(40),
//           ),
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 3.5,
//         ),
//         style: ListTileStyle.drawer,
//         onTap: item.onTap,
//       ),
//     );
//   }
// }
//
// class CustomDrawerWidget extends StatelessWidget {
//   const CustomDrawerWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     final List<DrawerItemModel> drawerItems = [
//       DrawerItemModel(icon: Icons.home, title: "Home", onTap: () {}),
//       DrawerItemModel(icon: Icons.person, title: "Profile", onTap: () {}),
//       DrawerItemModel(icon: Icons.settings, title: "Settings", onTap: () {}),
//       DrawerItemModel(
//         icon: Icons.notifications,
//         title: "Notifications",
//         onTap: () {},
//       ),
//       DrawerItemModel(
//         icon: Icons.help_outline,
//         title: "Help & Support",
//         onTap: () {},
//       ),
//       DrawerItemModel(icon: Icons.logout, title: "Logout", onTap: () {}),
//       DrawerItemModel(icon: Icons.home, title: "Home", onTap: () {}),
//       DrawerItemModel(icon: Icons.person, title: "Profile", onTap: () {}),
//       DrawerItemModel(icon: Icons.settings, title: "Settings", onTap: () {}),
//       DrawerItemModel(
//         icon: Icons.notifications,
//         title: "Notifications",
//         onTap: () {},
//       ),
//       DrawerItemModel(
//         icon: Icons.help_outline,
//         title: "Help & Support",
//         onTap: () {},
//       ),
//       DrawerItemModel(icon: Icons.logout, title: "Logout", onTap: () {}),
//     ];
//
//     return Drawer(
//       width: 280,
//       // surfaceTintColor: Colors.deepPurple.shade100,
//       backgroundColor: Colors.deepPurple.shade100,
//       elevation: 10,
//       child: Column(
//         children: [
//           Column(
//             children: [
//               Container(
//                 color: Colors.deepPurple.shade200,
//                 width: size.width,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 30),
//                     const Padding(
//                       padding: EdgeInsets.all(10.0),
//                       child: CircleAvatar(
//                         radius: 80,
//                         backgroundImage: NetworkImage(
//                           "https://t3.ftcdn.net/jpg/03/77/30/16/360_F_377301660_ClhyVNc3ThqShLjkfk7zq0SeCenc4xb7.jpg",
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       "Raj Singhaniya",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         shadows: [
//                           Shadow(color: Colors.grey, offset: Offset(0, 2)),
//                         ],
//                       ),
//                     ),
//                     const Text(
//                       "raj1234@gmail.com",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                         shadows: [
//                           Shadow(color: Colors.grey, offset: Offset(0, 2)),
//                         ],
//                       ),
//                     ),
//                     Divider(thickness: 2, color: Colors.white),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               clipBehavior: Clip.hardEdge,
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               itemCount: drawerItems.length,
//               itemBuilder: (context, index) {
//                 final item = drawerItems[index];
//                 return DrawerItemWidget(
//                   item: item,
//                   isLogout: item.title == "Logout",
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//------------------------------------------------------

import 'package:flutter/material.dart';
import 'dart:ui';

class DrawerItemModel {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

class DrawerItemWidget extends StatelessWidget {
  final DrawerItemModel item;
  final bool isLogout;

  const DrawerItemWidget({
    super.key,
    required this.item,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.white.withOpacity(0.1), // glass effect
            child: ListTile(
              leading: Icon(item.icon, size: 26, color: Colors.white),
              title: Text(
                item.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              trailing: isLogout
                  ? null
                  : Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.white),
              ),
              onTap: item.onTap,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<DrawerItemModel> drawerItems = [
      DrawerItemModel(icon: Icons.home, title: "Home", onTap: () {}),
      DrawerItemModel(icon: Icons.person, title: "Profile", onTap: () {}),
      DrawerItemModel(icon: Icons.settings, title: "Settings", onTap: () {}),
      DrawerItemModel(
          icon: Icons.notifications, title: "Notifications", onTap: () {}),
      DrawerItemModel(
          icon: Icons.help_outline, title: "Help & Support", onTap: () {}),
      DrawerItemModel(icon: Icons.logout, title: "Logout", onTap: () {}),
      DrawerItemModel(icon: Icons.home, title: "Home", onTap: () {}),
      DrawerItemModel(icon: Icons.person, title: "Profile", onTap: () {}),
      DrawerItemModel(icon: Icons.settings, title: "Settings", onTap: () {}),
      DrawerItemModel(
          icon: Icons.notifications, title: "Notifications", onTap: () {}),
      DrawerItemModel(
          icon: Icons.help_outline, title: "Help & Support", onTap: () {}),
      DrawerItemModel(icon: Icons.logout, title: "Logout", onTap: () {}),
    ];

    return Drawer(
      width: 280,
      backgroundColor: Colors.deepPurple.shade100,
      elevation: 10,
      child: Column(
        children: [
          // Header
          Container(
            color: Colors.deepPurple.shade200,
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                      "https://t3.ftcdn.net/jpg/03/77/30/16/360_F_377301660_ClhyVNc3ThqShLjkfk7zq0SeCenc4xb7.jpg",
                    ),
                  ),
                ),
                const Text(
                  "Raj Singhaniya",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.grey, offset: Offset(0, 2))],
                  ),
                ),
                const Text(
                  "raj1234@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.grey, offset: Offset(0, 2))],
                  ),
                ),
                const Divider(thickness: 2, color: Colors.white),
              ],
            ),
          ),

          // Scrollable List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: drawerItems.length,
              itemBuilder: (context, index) {
                final item = drawerItems[index];
                return DrawerItemWidget(
                  item: item,
                  isLogout: item.title == "Logout",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------------
// ListTile(
// onTap: () {},
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(50),
// bottomRight: Radius.circular(50),
// ),
// ),
// tileColor: Colors.white,
// leading: Icon(Icons.home_outlined),
// title: Text("Message"),
// trailing: Icon(Icons.arrow_forward_outlined),
// ),
