import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String data;

  const DetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page')),
      body: Center(
        child: Text(data), // Hiển thị tham số nhận được
      ),
    );
  }
}
