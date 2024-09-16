//! Ví dụ 2: Wrap với Axis.vertical và runAlignment.center

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wrap Vertical Example'),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Wrap(
            direction: Axis.vertical, // Sắp xếp theo trục dọc
            spacing: 10.0, // Khoảng cách giữa các con theo chiều dọc
            runSpacing: 20.0, // Khoảng cách giữa các cột khi wrap sang cột mới
            runAlignment: WrapAlignment.center, // Căn giữa các cột
            children: <Widget>[
              Container(
                width: 200,
                height: 100,
                color: Colors.red,
                child: const Center(child: Text('Item 1')),
              ),
              Container(
                width: 100,
                height: 200,
                color: Colors.red,
                child: const Center(child: Text('Item 1')),
              ),
              Container(
                width: 200,
                height: 100,
                color: Colors.red,
                child: const Center(child: Text('Item 1')),
              ),
              Container(
                width: 200,
                height: 100,
                color: Colors.red,
                child: const Center(child: Text('Item 1')),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: const Center(child: Text('Item 2')),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(child: Text('Item 3')),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.orange,
                child: const Center(child: Text('Item 4')),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.purple,
                child: const Center(child: Text('Item 5')),
              ),
              Container(
                width: 100,
                height: 300,
                color: Colors.purple,
                child: const Center(child: Text('Item 6')),
              ),
              Container(
                width: 100,
                height: 500,
                color: Colors.purple,
                child: const Center(child: Text('Item 6')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
