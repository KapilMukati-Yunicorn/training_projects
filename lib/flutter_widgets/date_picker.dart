import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              _selectedDate == null
                  ? "No Date Selected"
                  : DateFormat("dd/MM/yyyy").format(_selectedDate!),
            ),
            ElevatedButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        //   colorScheme: const ColorScheme.light(
                        // primary: Colors.cyan,
                        // onPrimary: Colors.white,
                        // onSurface: Colors.black
                        datePickerTheme: DatePickerThemeData(
                          dayShape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          dayBackgroundColor:
                              MaterialStateProperty.resolveWith<Color?>((
                                states,
                              ) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.cyan;
                                } else if (states.contains(
                                  MaterialState.disabled,
                                )) {
                                  return Colors.green;
                                } else {
                                  return Colors.deepPurple.shade400;
                                }
                              }),

                          elevation: 5,
                          dayForegroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          shadowColor: Colors.green,
                          // dayForegroundColor:
                          cancelButtonStyle: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                              Colors.red,
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Colors.white,
                            ),
                          ),
                          confirmButtonStyle: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                              Colors.deepPurple,
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Colors.white,
                            ),
                          ),
                          todayBackgroundColor: MaterialStateProperty.all(
                            Colors.red.shade400,
                          ),
                          backgroundColor: Colors.grey.shade300,
                          headerBackgroundColor: Colors.cyan,
                          headerForegroundColor: Colors.white,
                          // subHeaderForegroundColor: Colors.red,
                          weekdayStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),

                      ),
                      child: child!,
                    );
                  },

                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                );

                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(width: 10),
                  Text(
                    "Pick Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
