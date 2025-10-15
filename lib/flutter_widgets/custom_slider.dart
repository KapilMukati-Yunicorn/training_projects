import 'package:flutter/material.dart';

class MyCustomSliderState extends StatefulWidget {
  @override
  _MyCustomSliderState createState() => _MyCustomSliderState();
}

class _MyCustomSliderState extends State<MyCustomSliderState> {
  double _value = 0.2; // note: we use min=0, max=100

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider Basic')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Container(
              height: 200,
              color: Colors.green.withOpacity(_value),
              width: MediaQuery.of(context).size.width*0.8,

            ),
            SizedBox(height: 30),
            Text('Value: ${_value.toStringAsFixed(0)}'),
            Slider(
              value: _value,
              min: 0,
              max: 1,
              label: _value.toString(),
              divisions: 10,
              autofocus: true,
              // allowedInteraction: SliderInteraction.slideOnly,

              activeColor: Colors.deepPurple,
              thumbColor: Colors.white,
              onChanged: (newValue) {
                setState(() => _value = newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
