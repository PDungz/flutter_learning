//! DatePicker
//? DatePicker cho phép người dùng chọn ngày từ một giao diện chọn ngày.
//? Đây là một phần quan trọng của nhiều ứng dụng yêu cầu người dùng nhập ngày tháng.

//? Cách Sử Dụng
//? showDatePicker: Hàm giúp hiển thị giao diện chọn ngày.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyDatePickerExample(),
  ));
}

class MyDatePickerExample extends StatefulWidget {
  const MyDatePickerExample({Key? key}) : super(key: key);

  @override
  State<MyDatePickerExample> createState() => _MyDatePickerExampleState();
}

class _MyDatePickerExampleState extends State<MyDatePickerExample> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DatePicker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Date: ${_selectedDate.toLocal()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
