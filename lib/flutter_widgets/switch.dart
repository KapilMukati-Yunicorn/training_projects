import 'package:flutter/material.dart';

class MySwitchWidget extends StatefulWidget {
  const MySwitchWidget({super.key});

  @override
  State<MySwitchWidget> createState() => _MySwitchWidgetState();
}

class _MySwitchWidgetState extends State<MySwitchWidget> {
  bool _toggleSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Widget"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Switch.adaptive(
          splashRadius:60,
          value: _toggleSwitch,
          trackOutlineWidth: WidgetStateProperty.all(1),
          // thumbColor: WidgetStateProperty.all(Colors.white),
          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          // activeThumbColor: Colors.green,
          // thumbIcon: WidgetStateProperty.all(Icon(Icons.person_outline)),
          // splashRadius: 10,
          // overlayColor: WidgetStateProperty.all(Colors.red),
          activeColor: Colors.white,
          activeTrackColor: Colors.green,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey.shade400,

          onChanged: (value) {
            setState(() {
              _toggleSwitch = !_toggleSwitch;
            });
          },
        ),
      ),
    );
  }
}
