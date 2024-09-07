import 'package:flutter/material.dart';

import 'screen1.dart'; // Import các màn hình khác
import 'screen2.dart';
import 'screen3.dart';

//! Column là gì?
// Column trong Flutter là một widget được sử dụng để xếp các widget con theo chiều dọc (trên cùng một cột).
// Mỗi con của Column sẽ được đặt từ trên xuống dưới theo thứ tự mà chúng được khai báo.

// Tương tự như Row, Column không cuộn được theo mặc định, nên nếu các widget con vượt quá chiều cao màn hình,
// bạn cần sử dụng các widget cuộn như SingleChildScrollView.

//! Aligment
/* 
  - Column có thể căn chỉnh các con bên trong theo các trục khác nhau: \
      mainAxis (trục chính, là trục dọc) 
      crossAxis (trục phụ, là trục ngang).

  - Các thuộc tính căn chỉnh bao gồm: 
      mainAxisAlignment: Xác định cách phân bổ không gian dọc theo trục chính (trục dọc).
      crossAxisAlignment: Xác định cách căn chỉnh các con dọc theo trục phụ (trục ngang).
*/

void main() => runApp(const MyApp());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Column Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Screen1()),
                );
              },
              child: const Text('Column with MainAxisAlignment.spaceAround'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Screen2()),
                );
              },
              child: const Text('Column with MainAxisAlignment.start'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Screen3()),
                );
              },
              child: const Text('Column with VerticalDirection.up'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Column Examples',
      home: HomeScreen(),
    );
  }
}
