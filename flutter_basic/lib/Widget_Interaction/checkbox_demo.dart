//! Checkbox
//? Checkbox cho phép người dùng chọn hoặc bỏ chọn một tùy chọn.
//? Nó có thể được sử dụng độc lập hoặc nhóm với các checkbox khác để tạo thành một nhóm lựa chọn.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyCheckboxExample(),
  ));
}

class MyCheckboxExample extends StatefulWidget {
  const MyCheckboxExample({Key? key}) : super(key: key);

  @override
  State<MyCheckboxExample> createState() => _MyCheckboxExampleState();
}

class _MyCheckboxExampleState extends State<MyCheckboxExample> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Example'),
      ),
      body: Center(
        child: CheckboxListTile(
          title: const Text('Check me'),
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
      ),
    );
  }
}
