//! Stack trong Flutter là gì?
// Stack trong Flutter là một widget cho phép bạn xếp chồng các widget con lên nhau.
// Thay vì xếp các widget theo chiều dọc (như Column) hoặc chiều ngang (như Row),
// Stack xếp các widget con theo layer.
// Widget con nào được khai báo sau sẽ được vẽ lên trên các widget con được khai báo trước đó,
// giống như các lớp chồng lên nhau.

//? Stack rất hữu ích khi bạn muốn hiển thị các widget đè lên nhau,
//? ví dụ như đặt văn bản trên một hình ảnh, hoặc thêm một biểu tượng thông báo lên biểu tượng ứng dụng.

//! Đặc tính của Stack
//? Alignment (Căn chỉnh)
// Các widget con trong Stack có thể được căn chỉnh theo các vị trí khác nhau trong bố cục bằng cách sử dụng thuộc tính alignment.
// Mặc định, các con của Stack được đặt ở góc trên bên trái.

// Một số giá trị của alignment:
/*
  - Alignment.topLeft: Đặt widget con ở góc trên cùng bên trái.
  - Alignment.center: Đặt widget con ở giữa Stack.
  - Alignment.bottomRight: Đặt widget con ở góc dưới bên phải.
 */

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Stack Example'),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.topLeft, // Căn giữa các con trong Stack
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                color: Colors.red, // Hình vuông đỏ ở dưới cùng
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.green, // Hình vuông xanh lá ở giữa
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue, // Hình vuông xanh dương ở trên cùng
              ),
            ],
          ),
        ),
      ),
    );
  }
}
