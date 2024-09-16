import 'package:flutter/material.dart';

//? Positioned (Định vị widget con):

// Widget Positioned cho phép bạn định vị một widget con cụ thể trong Stack
// bằng cách đặt các giá trị khoảng cách từ các cạnh của Stack (trái, phải, trên, dưới).
// Ví dụ, bạn có thể sử dụng Positioned để đặt một widget cách cạnh trên của Stack 10 pixel và cách cạnh trái 20 pixel.

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Positioned Stack Example'),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                color: Colors.red, // Container màu đỏ nền
              ),
              Positioned(
                top: 50,
                left: 50,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors
                      .green, // Container màu xanh lá được định vị ở góc trên trái
                ),
              ),
              Positioned(
                bottom: 50,
                right: 50,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors
                      .blue, // Container màu xanh dương được định vị ở góc dưới phải
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
