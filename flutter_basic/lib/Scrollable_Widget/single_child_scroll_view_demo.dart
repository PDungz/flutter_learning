//! SingleChildScrollView
//? SingleChildScrollView là widget cho phép cuộn nội dung
//  khi nội dung vượt quá kích thước của viewport.
//  Nó chỉ hỗ trợ một phần tử con duy nhất
//  nhưng phần tử này có thể là một widget chứa nhiều phần tử con khác, vd: Column, Row.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SingleChildScrollView Example')),
        body: const ScrollableContent(),
      ),
    );
  }
}

class ScrollableContent extends StatelessWidget {
  const ScrollableContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //? Cuộn Theo Chiều Ngang
      scrollDirection: Axis.horizontal,
      child: Column(
        children: List.generate(
          20,
          (index) => ListTile(
            title: Text('Item $index'),
          ),
        ),
      ),
    );
  }
}
