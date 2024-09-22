//! Ví dụ 1: Sử Dụng Navigator với MaterialPageRoute

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CupertinoNewPage extends StatelessWidget {
  const CupertinoNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Page')),
      body: Center(
          child: Column(
        children: [
          const Text('Welcome to the New Page'),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close current screen"))
        ],
      )),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Navigator')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                //! push
                // Mở một màn hình (route) mới và thêm nó vào ngăn xếp hiện tại.
                Navigator.push(
                  context,
                  //! MaterialPageRoute
                  //? MaterialPageRoute là một lớp trong Flutter dùng để tạo một route mới
                  //? với hiệu ứng chuyển động theo kiểu Material Design
                  MaterialPageRoute(
                      //? builder function, nơi bạn trả về widget mà bạn muốn hiển thị trên route mới.
                      builder: (context) => const MaterialNewPage()),
                );
              },
              child: const Text('Go to New Page with Material style'),
            ),
            ElevatedButton(
                onPressed: () {
                  //! CupertinoPageRoute
                  //? Dùng cho ứng dụng có giao diện iOS. Nó cung cấp hiệu ứng chuyển động giống như iOS,
                  //? với trang mới trượt từ bên dưới lên.
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const CupertinoNewPage()),
                  );
                },
                child: const Text('Go to New Page with Cupertino style'))
          ],
        ),
      ),
    );
  }
}

class MaterialNewPage extends StatelessWidget {
  const MaterialNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Page')),
      body: Center(
          child: Column(
        children: [
          const Text('Welcome to the New Page'),
          ElevatedButton(
              onPressed: () {
                //! pop
                //? Đóng màn hình hiện tại và quay lại màn hình trước đó trong ngăn xếp.
                Navigator.pop(context);
              },
              child: const Text("Close current screen"))
        ],
      )),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
