import 'package:flutter/material.dart';

class CustomNavBarDemo extends StatefulWidget {
  const CustomNavBarDemo({super.key});

  @override
  State<CustomNavBarDemo> createState() => _CustomNavBarDemoState();
}

class _CustomNavBarDemoState extends State<CustomNavBarDemo> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    Center(child: Text("Home Screen", style: TextStyle(fontSize: 25))),
    Center(child: Text("Search Screen", style: TextStyle(fontSize: 25))),
    Center(child: Text("Favorite Screen", style: TextStyle(fontSize: 25))),
    Center(child: Text("Profile Screen", style: TextStyle(fontSize: 25))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Navigation Bar"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _screens[_selectedIndex],

          /// ✅ Bottom Navigation Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.cyan.shade200,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavItem(
                    icon: Icons.home_outlined,
                    label: "Home",
                    isSelected: _selectedIndex == 0,
                    onTap: () => setState(() => _selectedIndex = 0),
                  ),
                  NavItem(
                    icon: Icons.search_outlined,
                    label: "Search",
                    isSelected: _selectedIndex == 1,
                    onTap: () => setState(() => _selectedIndex = 1),
                  ),
                  NavItem(
                    icon: Icons.favorite_outline,
                    label: "Likes",
                    isSelected: _selectedIndex == 2,
                    onTap: () => setState(() => _selectedIndex = 2),
                  ),
                  NavItem(
                    icon: Icons.person_outline,
                    label: "Profile",
                    isSelected: _selectedIndex == 3,
                    onTap: () => setState(() => _selectedIndex = 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ✅ Reusable Widget
class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: isSelected ? 10 : 0,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white70,
              size: isSelected ? 34 : 28,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: isSelected
                  ? Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
