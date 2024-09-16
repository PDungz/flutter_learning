//! Wrap trong Flutter là gì?
// Wrap trong Flutter là một widget dùng để sắp xếp các widget con thành hàng
// hoặc cột
// và cho phép chúng tự động "wrap" (chuyển dòng) khi không còn đủ không gian
// trên màn hình theo chiều chính (trục ngang hoặc dọc).

//Khác với Row và Column (chỉ hiển thị trên một dòng hoặc cột và gây lỗi overflow khi con vượt quá không gian),
// Wrap giúp con chuyển xuống dòng mới hoặc cột mới khi hết không gian.

//! Đặc tính của Wrap
//? Direction (Hướng)
// Wrap có thể sắp xếp các con theo hai hướng: trục ngang (horizontal) hoặc trục dọc (vertical).
// Bạn có thể chọn hướng hiển thị con bằng thuộc tính direction:
//  - Axis.horizontal: Xếp con theo hàng ngang.
//  - Axis.vertical: Xếp con theo cột dọc.

//? Alignment (Căn chỉnh theo trục chính và phụ)
// alignment: Căn chỉnh các con trên trục chính (cùng hàng hoặc cột).
// crossAxisAlignment: Căn chỉnh các con theo trục phụ (theo cột trong trục ngang hoặc theo hàng trong trục dọc).

//? Spacing (Khoảng cách giữa các widget con):
// spacing: Quy định khoảng cách giữa các con trên trục chính.
// runSpacing: Quy định khoảng cách giữa các dòng (nếu các con wrap sang dòng mới).

//? Run Alignment (Căn chỉnh dòng):
// runAlignment: Quy định cách căn chỉnh các dòng (run) khi có nhiều dòng trong Wrap.
//               Tương tự mainAxisAlignment nhưng được áp dụng cho dòng khi wrap.

// Ví dụ, WrapAlignment.center sẽ căn giữa tất cả các dòng trong Wrap.

//! Ví dụ 1: Wrap các con theo trục ngang với spacing

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Wrap Example'),
        ),
        body: Center(
          child: Wrap(
            spacing: 10.0, // Khoảng cách giữa các con theo chiều ngang
            runSpacing: 20.0, // Khoảng cách giữa các dòng
            children: <Widget>[
              Container(
                width: 100,
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
            ],
          ),
        ),
      ),
    );
  }
}
