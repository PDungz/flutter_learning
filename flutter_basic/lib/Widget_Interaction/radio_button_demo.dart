//! Radio Button
//? Radio button cho phép người dùng chọn một trong một nhóm các lựa chọn.
//? Khi một lựa chọn được chọn, các lựa chọn khác trong nhóm sẽ bị bỏ chọn.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyRadioButtonExample(),
  ));
}

class MyRadioButtonExample extends StatefulWidget {
  const MyRadioButtonExample({Key? key}) : super(key: key);

  @override
  State<MyRadioButtonExample> createState() => _MyRadioButtonExampleState();
}

class _MyRadioButtonExampleState extends State<MyRadioButtonExample> {
  String _selectedRadioListTileValue = 'Option 1';
  String _selectedRadioValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Button Example'),
      ),
      body: Column(
        children: [
          const Text("Radio List Tile Widget"),
          RadioListTile<String>(
            title: const Text('Option 1'),
            value: 'Option 1',
            groupValue: _selectedRadioListTileValue,
            onChanged: (value) {
              setState(() {
                _selectedRadioListTileValue = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Option 2'),
            value: 'Option 2',
            groupValue: _selectedRadioListTileValue,
            onChanged: (value) {
              setState(() {
                _selectedRadioListTileValue = value!;
              });
            },
          ),
          const Text("Radio Widget"),
          Radio(
            value: "Option 1",
            groupValue: _selectedRadioValue,
            onChanged: (value) {
              setState(() {
                _selectedRadioValue = value!;
              });
            },
          ),
          Radio(
            value: "Option 2",
            groupValue: _selectedRadioValue,
            onChanged: (value) {
              setState(() {
                _selectedRadioValue = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
