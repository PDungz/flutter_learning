//! DropdownButton
//? Mô Tả: DropdownButton cho phép người dùng chọn một giá trị từ một danh sách các tùy chọn.
//? Nó thường được sử dụng để tiết kiệm không gian trên giao diện người dùng.

//? Cách Sử Dụng:
//?   - DropdownButton: Widget cho phép chọn một tùy chọn từ danh sách.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyDropdownExample(),
  ));
}

class MyDropdownExample extends StatefulWidget {
  const MyDropdownExample({Key? key}) : super(key: key);

  @override
  State<MyDropdownExample> createState() => _MyDropdownExampleState();
}

class _MyDropdownExampleState extends State<MyDropdownExample> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Example'),
      ),
      body: Center(
        child: DropdownButton<String>(
          hint: const Text('Select an option'),
          value: _selectedItem,
          items: ['Option 1', 'Option 2', 'Option 3']
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedItem = value;
            });
          },
        ),
      ),
    );
  }
}
