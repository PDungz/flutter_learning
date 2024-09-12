//! Stateless Widget là gì?
// StatelessWidget là một loại widget không có trạng thái.
// Nó chỉ mô tả giao diện người dùng dựa trên các thuộc tính (props) của nó.

// Khi các thuộc tính thay đổi,
// widget sẽ được xây dựng lại nhưng widget không tự thay đổi trạng thái của chính nó.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //? MyStatelessWidget chỉ đơn giản hiển thị một Text widget với giá trị text truyền vào.
      //? Khi giá trị text thay đổi, widget sẽ được xây dựng lại với giá trị mới.
      home: MyStatelessWidget(text: 'Hello, World!'),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  String text;

  MyStatelessWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            TextButton(
                onPressed: () {
                  text = "Hello, Huy";
                },
                child: const Text("Press to change Text"))
          ],
        ),
      ),
    );
  }
}
