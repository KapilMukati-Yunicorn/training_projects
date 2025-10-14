import 'package:flutter/material.dart';

class MyCustomTimePicker extends StatefulWidget {
  const MyCustomTimePicker({super.key});

  @override
  State<MyCustomTimePicker> createState() => _MyCustomTimePickerState();
}

class _MyCustomTimePickerState extends State<MyCustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Picker"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Text("Time Picker"),
          ElevatedButton(
            onPressed: () async {
              TimeOfDay? _timePicker = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (context, child) {
                  return Theme(data: Theme.of(context).copyWith(
                    timePickerTheme: TimePickerThemeData(
                      dialBackgroundColor: Colors.deepPurple.shade300,
                      dialHandColor: Colors.grey,
                      dialTextColor: Colors.white60,
                      backgroundColor: Colors.grey,
                      hourMinuteColor: Colors.white,
                      dayPeriodColor: Colors.deepPurple.shade300,
                      dayPeriodShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(10, 40))),
                      dialTextStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600
                      ),
                      timeSelectorSeparatorTextStyle: MaterialStateProperty.all(TextStyle(
                        color: Colors.red
                      )),
                    )
                  ), child: child!);
                },
              );
            },
            child: Text("Pick Time"),
          ),
        ],
      ),
    );
  }
}
